import { Media } from '@database/entities/media.entity';
import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { cloudinaryUploader } from '@config/cloudinary.config';
import { ConfigService } from '@nestjs/config';
import { UploadFileDto } from './dto/upload-file.dto';
import { unlink } from 'fs';
import { DeleteImagesDto } from './dto/delete-images.dto';

@Injectable()
export class MediaService {
  private cloudinaryClient;

  constructor(
    private configService: ConfigService,
    @InjectRepository(Media)
    private mediaRepository: Repository<Media>,
  ) {
    this.cloudinaryClient = cloudinaryUploader;
  }

  async uploadOne(
    file: Express.Multer.File,
    uploadFileDto: UploadFileDto,
  ): Promise<Media> {
    if (!file) {
      throw new HttpException(
        {
          status: HttpStatus.UNPROCESSABLE_ENTITY,
          errors: {
            file: 'selectFile',
          },
        },
        HttpStatus.UNPROCESSABLE_ENTITY,
      );
    }

    const { path } = file;

    try {
      const { url, public_id } = await this.cloudinaryClient.upload(path, {
        folder: uploadFileDto.folderName,
      });

      const media = this.mediaRepository.create({
        public_id: public_id,
        url: url,
      });
      await this.mediaRepository.save(media);

      return media;
    } catch (error) {
      throw new HttpException(
        {
          status: HttpStatus.UNPROCESSABLE_ENTITY,
          errors: {
            url: 'Error while uploading file',
          },
        },
        HttpStatus.UNPROCESSABLE_ENTITY,
      );
    } finally {
      unlink(path, (err) => {
        if (err) {
          throw new HttpException(
            {
              status: HttpStatus.UNPROCESSABLE_ENTITY,
              errors: {
                url: 'Error while deleting local file',
              },
            },
            HttpStatus.UNPROCESSABLE_ENTITY,
          );
        }
      });
    }
  }

  async uploadMany(
    files: Express.Multer.File[],
    uploadFileDto: UploadFileDto,
  ): Promise<Media[]> {
    const maxFileUpload = this.configService.get('MAX_FILE_UPLOAD');

    if (files.length > maxFileUpload) {
      throw new HttpException(
        {
          status: HttpStatus.UNPROCESSABLE_ENTITY,
          errors: {
            file: 'limitFileQuantity',
          },
        },
        HttpStatus.UNPROCESSABLE_ENTITY,
      );
    }

    const uploadTasks = files.map((file) =>
      this.uploadOne(file, uploadFileDto),
    );

    return Promise.all(uploadTasks);
  }

  async deleteOne(public_id: string) {
    try {
      const response = await this.cloudinaryClient.destroy(public_id);

      await this.mediaRepository.delete({ public_id });

      return {
        public_id,
        ...response,
      };
    } catch (error) {
      throw new HttpException(
        {
          status: HttpStatus.UNPROCESSABLE_ENTITY,
          errors: {
            url: 'Error while deleting file',
          },
        },
        HttpStatus.UNPROCESSABLE_ENTITY,
      );
    }
  }

  async deleteMany(deleteImagesDto: DeleteImagesDto) {
    const deleteTasks = deleteImagesDto.public_ids.map((public_id) =>
      this.deleteOne(public_id),
    );

    return Promise.all(deleteTasks);
  }
}
