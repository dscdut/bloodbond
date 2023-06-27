import { ApiProperty } from '@nestjs/swagger';

export class UploadFileResponse {
  @ApiProperty({
    type: String,
    example: '485e0729-52cb-4dbf-ab6b-c25585758dd8',
  })
  id: string;

  @ApiProperty({
    type: String,
    example:
      'https://res.cloudinary.com/dq7l8216n/image/upload/v1623771233/485e0729-52cb-4dbf-ab6b-c25585758dd8.jpg',
  })
  url: string;
}
