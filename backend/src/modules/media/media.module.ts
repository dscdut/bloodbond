import { Module, HttpException, HttpStatus } from '@nestjs/common';
import { MediaController } from './media.controller';
import { MediaService } from './media.service';
import { MulterModule } from '@nestjs/platform-express';
import { Media } from '@database/entities/media.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { diskStorage } from 'multer';
import { randomStringGenerator } from '@nestjs/common/utils/random-string-generator.util';
import { ROOT_DIR } from '@core/constant';

@Module({
  imports: [
    TypeOrmModule.forFeature([Media]),
    MulterModule.registerAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => {
        const storages = {
          local: () => {
            const tempFolderStorage = configService.get('LOCAL_STORAGE_PATH');

            return diskStorage({
              destination: `${ROOT_DIR}/${tempFolderStorage}`,
              filename: (req, file, callback) => {
                callback(
                  null,
                  `${randomStringGenerator()}.${file.originalname
                    .split('.')
                    .pop()
                    ?.toLowerCase()}`,
                );
              },
            });
          },
        };

        return {
          fileFilter: (req, file, callback) => {
            if (!file.originalname.match(/\.(jpg|jpeg|png|gif)$/i)) {
              return callback(
                new HttpException(
                  {
                    status: HttpStatus.UNPROCESSABLE_ENTITY,
                    errors: {
                      file: 'cantUploadFileType',
                    },
                  },
                  HttpStatus.UNPROCESSABLE_ENTITY,
                ),
                false,
              );
            }

            callback(null, true);
          },
          storage:
            storages[
              configService.get<string>('STORAGE_TYPE', { infer: true })
            ](),
          limits: {
            fileSize: configService.get('MAX_FILE_SIZE', { infer: true }),
          },
        };
      },
    }),
  ],
  controllers: [MediaController],
  providers: [MediaService, ConfigService, ConfigModule],
})
export class MediaModule {}
