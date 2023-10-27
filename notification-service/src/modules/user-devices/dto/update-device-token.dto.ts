import { IsOptional, IsString } from 'class-validator';

export class UpdateDeviceTokenDto {
  @IsString()
  @IsOptional()
  deviceToken: string;
}

export default UpdateDeviceTokenDto;
