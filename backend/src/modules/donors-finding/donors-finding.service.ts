import { User } from '@database/entities';
import {
  BadRequestException,
  HttpException,
  HttpStatus,
  Inject,
  Injectable,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import type { FindDonorsResponse } from './response/find-donors.response';
import type { GetDonorInfoResponse } from './response/get-donor-info.response';
import { ClientProxy } from '@nestjs/microservices';
import { catchError, map } from 'rxjs';
import { UserDevice } from '@shared/types/user-device-type';
import { NotificationTemplateService } from '@modules/notification-template/notification-template.service';

@Injectable()
export class DonorsFindingService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
    @Inject('USER_DEVICES_SERVICE') private userDeviceService: ClientProxy,
    @Inject('NOTIFICATION_SERVICE') private notificationService: ClientProxy,
    private readonly notificationTemplateSerivice: NotificationTemplateService,
  ) {}

  async findDonors(
    bloodTypeId: number,
    radius: number,
    currentLat: number,
    currentLng: number,
  ): Promise<FindDonorsResponse[]> {
    try {
      const notificationContent =
        this.notificationTemplateSerivice.sendBloodDonationRequestNotification();

      const donors = await this.userRepository
        .createQueryBuilder('user')
        .innerJoinAndSelect('user.bloodType', 'blood_types')
        .select([
          'user.id',
          'blood_types.id',
          'blood_types.name',
          'user.address',
          'user.geom',
        ])
        .where('user.blood_type_id = :bloodTypeId', { bloodTypeId })
        .andWhere(
          `ST_DWithin(
                user.geom, 
                ST_SetSRID(ST_MakePoint(:lng, :lat), 4326),
                :radius,
                true
            )`,
        )
        .setParameters({
          lng: currentLng,
          lat: currentLat,
          radius: radius,
        })
        .getMany();

      const donorIds = donors.map((each) => each.id.toString());

      this.userDeviceService
        .send({ cmd: 'get-many-devices-by-user-ids' }, donorIds)
        .pipe(
          map((data) => {
            const deviceTokenForPushNotification = data.reduce(
              (acc: string[], each: UserDevice) => {
                const { notification } = each.settings;
                if (notification.push) {
                  acc.push(each.deviceToken);
                }
                return acc;
              },
              [],
            );

            return deviceTokenForPushNotification;
          }),
        )
        .subscribe((deviceTokenForPushNotification) => {
          this.notificationService
            .send(
              { cmd: 'send-notification' },
              {
                deviceTokens: deviceTokenForPushNotification,
                title: notificationContent.title,
                body: notificationContent.body,
              },
            )
            .pipe(
              catchError((error) => {
                throw new HttpException(error, HttpStatus.BAD_REQUEST);
              }),
            )
            .subscribe();
        });

      return donors;
    } catch (error) {
      throw new BadRequestException(error.message);
    }
  }

  async getDonorById(
    donorId: string,
    currentLat: number,
    currentLng: number,
  ): Promise<GetDonorInfoResponse> {
    try {
      const donor = await this.userRepository
        .createQueryBuilder('user')
        .innerJoinAndSelect('user.bloodType', 'blood_types')
        .select([
          'user.id as id',
          'user.name as name',
          'user.avatar as avatar',
          'user.email as email',
          'user.phone_number as phone_number',
          'blood_types.id as blood_type_id',
          'blood_types.name as blood_type_name',
          'user.address as address',
          `ST_Distance(
                user.geom,
                st_makepoint(:lng, :lat)::geography
            ) as distance`,
        ])
        .where('user.id = :donorId', { donorId })
        .setParameters({
          lng: currentLng,
          lat: currentLat,
        })
        .getRawOne();

      return {
        id: donor.id,
        name: donor.name,
        avatar: donor.avatar,
        email: donor.email,
        phoneNumber: donor.phone_number,
        bloodType: {
          id: donor.blood_type_id,
          name: donor.blood_type_name,
        },
        address: donor.address,
        distance: donor.distance,
      };
    } catch (error) {
      throw new BadRequestException(error.message);
    }
  }
}
