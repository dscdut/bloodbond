import { IsNotEmpty, IsObject, IsOptional, IsString } from 'class-validator';

export class UserDeviceDto {
  @IsString()
  @IsNotEmpty()
  userId: string;

  @IsString()
  @IsNotEmpty()
  deviceToken: string;

  @IsObject()
  @IsOptional()
  settings: Record<string, unknown>;
}

export default UserDeviceDto;
