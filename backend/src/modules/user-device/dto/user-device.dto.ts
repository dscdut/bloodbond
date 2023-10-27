import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsNotEmpty, IsObject, IsOptional, IsString } from 'class-validator';

export class UserDeviceDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  deviceToken: string;

  @ApiPropertyOptional()
  @IsObject()
  @IsOptional()
  settings?: Record<string, unknown>;
}

export default UserDeviceDto;
