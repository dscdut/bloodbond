import {
  Controller,
  Post,
  UseInterceptors,
  HttpStatus,
  HttpCode,
  UploadedFiles,
  Body,
  Delete,
} from '@nestjs/common';
import { MediaService } from './media.service';
import {
  ApiBody,
  ApiConsumes,
  ApiOperation,
  ApiResponse,
  ApiTags,
} from '@nestjs/swagger';
import { FilesInterceptor } from '@nestjs/platform-express';
import { UploadFileDto } from './dto/upload-file.dto';
import { Media } from '@database/entities/media.entity';
import { UploadFileResponse } from './response/upload-file.response';
import { DeleteImagesDto } from './dto/delete-images.dto';

@Controller('media')
@ApiTags('media')
export class MediaController {
  constructor(private readonly mediaService: MediaService) {}

  @Post('/images')
  @ApiConsumes('multipart/form-data')
  @HttpCode(HttpStatus.OK)
  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        files: {
          type: 'file',
          format: 'binary',
        },
        folderName: {
          type: 'string',
        },
      },
    },
  })
  @ApiOperation({
    summary: 'Upload images',
    description: 'Upload images',
  })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Images uploaded successfully',
    type: UploadFileResponse,
  })
  @UseInterceptors(FilesInterceptor('files'))
  async uploadMany(
    @UploadedFiles() files: Express.Multer.File[],
    @Body() uploadFileDto: UploadFileDto,
  ): Promise<Media[]> {
    return this.mediaService.uploadMany(files, uploadFileDto);
  }

  @Delete('/images')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    summary: 'Delete images',
    description: 'Delete images',
  })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Images deleted successfully',
    type: [UploadFileResponse],
  })
  async deleteMany(@Body() deleteImagesDto: DeleteImagesDto) {
    return this.mediaService.deleteMany(deleteImagesDto);
  }
}
