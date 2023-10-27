import { IsNotEmpty, IsObject, IsOptional, IsString } from 'class-validator';

export class UpdateDeviceTokenDto {
  @IsString()
  @IsNotEmpty()
  userId: string;

  @IsString()
  @IsOptional()
  deviceToken?: string;

  @IsObject()
  @IsOptional()
  settings?: Record<string, any>;
}

export default UpdateDeviceTokenDto;
