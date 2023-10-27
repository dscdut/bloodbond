import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsObject, IsOptional, IsString } from 'class-validator';

export class UpdateDeviceTokenDto {
  @ApiPropertyOptional()
  @IsString()
  @IsOptional()
  deviceToken?: string;

  @ApiPropertyOptional()
  @IsObject()
  @IsOptional()
  settings?: Record<string, any>;
}

export default UpdateDeviceTokenDto;
