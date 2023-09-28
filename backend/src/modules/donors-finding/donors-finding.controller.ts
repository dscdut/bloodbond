import {
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  Query,
} from '@nestjs/common';
import { DonorsFindingService } from './donors-finding.service';
import { FindDonorsResponse } from './response/find-donors.response';
import { AuthenticateGuard } from '@modules/auth/guard/roles.decorator';
import { ApiOperation, ApiResponse } from '@nestjs/swagger';
import { GetDonorInfoResponse } from './response/get-donor-info.response';

@Controller('donors-finding')
export class DonorsFindingController {
  constructor(private readonly donorsFindingService: DonorsFindingService) {}

  @Get()
  @AuthenticateGuard()
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    tags: ['donors-finding'],
    operationId: 'findDonors',
    summary: 'Find donors that match with blood type and available in radius',
    description:
      'Find donors that match with blood type and available in radius',
  })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Successful',
    type: [FindDonorsResponse],
  })
  async findDonors(
    @Query('bloodTypeId') bloodTypeId: number,
    @Query('radius') radius: number,
    @Query('currentLat') currentLat: number,
    @Query('currentLng') currentLng: number,
  ): Promise<FindDonorsResponse[]> {
    return this.donorsFindingService.findDonors(
      bloodTypeId,
      radius,
      currentLat,
      currentLng,
    );
  }

  @Get(':donorId')
  @AuthenticateGuard()
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    tags: ['donors-finding'],
    operationId: 'findDonorById',
    summary: 'Get donor info by id',
    description: 'Get donor info by id',
  })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Successful',
    type: GetDonorInfoResponse,
  })
  async getDonorById(
    @Param('donorId') donorId: string,
    @Query('currentLat') currentLat: number,
    @Query('currentLng') currentLng: number,
  ): Promise<GetDonorInfoResponse> {
    return this.donorsFindingService.getDonorById(
      donorId,
      currentLat,
      currentLng,
    );
  }
}
