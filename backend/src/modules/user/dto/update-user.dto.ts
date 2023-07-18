import { ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsDate,
  IsInt,
  IsNumber,
  IsOptional,
  IsPhoneNumber,
  IsString,
  Matches,
  MinLength,
} from 'class-validator';

export class UpdateUserDto {
  @ApiPropertyOptional()
  @IsString()
  @MinLength(2)
  @IsOptional()
  name?: string;

  @ApiPropertyOptional()
  @IsString()
  @MinLength(10)
  @IsOptional()
  avatar?: string;

  @ApiPropertyOptional({
    type: String,
    example: '2003-01-01',
  })
  @IsString()
  @IsOptional()
  birthdate?: string;

  @ApiPropertyOptional()
  @IsString()
  @IsPhoneNumber('VN')
  @IsOptional()
  phoneNumber?: string;

  @ApiPropertyOptional()
  @IsString()
  @MinLength(10)
  @Matches(/^[0-9]*$/, {
    message: 'Citizenship number must be numeric',
  })
  @IsOptional()
  citizenshipNumber?: string;

  @ApiPropertyOptional()
  @IsInt()
  @IsOptional()
  bloodTypeId?: number;

  @ApiPropertyOptional()
  @IsString()
  @IsOptional()
  address?: string;

  @ApiPropertyOptional({
    type: Number,
    example: 123.456,
  })
  @IsNumber()
  @IsOptional()
  longitude?: number;

  @ApiPropertyOptional({
    type: Number,
    example: 123.456,
  })
  @IsNumber()
  @IsOptional()
  latitude?: number;
}
