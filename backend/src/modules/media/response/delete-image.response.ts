import { ApiProperty } from '@nestjs/swagger';

export class DeleteImagesResponse {
  @ApiProperty({
    type: String,
    example: '485e0729-52cb-4dbf-ab6b-c25585758dd8',
  })
  id: string;

  @ApiProperty({
    type: String,
    example: 'ok',
  })
  result: string;
}
