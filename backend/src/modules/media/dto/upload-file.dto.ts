import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export class UploadFileDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  folderName: string;
}
