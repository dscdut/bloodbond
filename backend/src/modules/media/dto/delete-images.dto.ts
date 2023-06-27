import { ApiProperty } from '@nestjs/swagger';
import { IsArray, IsNotEmpty } from 'class-validator';

export class DeleteImagesDto {
  @ApiProperty({
    type: [String],
  })
  @IsNotEmpty()
  @IsArray()
  public_ids: string[];
}
