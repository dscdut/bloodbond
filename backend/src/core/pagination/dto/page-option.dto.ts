import { ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsArray,
  IsInt,
  IsOptional,
  IsString,
  Max,
  Min,
} from 'class-validator';
import {
  DEFAULT_LIMIT,
  DEFAULT_PAGE,
  MAX_LIMIT,
} from '../constant/pagination.constant';
import { DEFAULT_SORT_COLUMN } from '../constant/order.constant';

export class PageOptionsDto {
  @ApiPropertyOptional({ default: `+${DEFAULT_SORT_COLUMN}` })
  @IsString()
  @IsOptional()
  readonly order?: string = `+${DEFAULT_SORT_COLUMN}`;

  @ApiPropertyOptional({
    name: 'filters[]',
  })
  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  readonly filters?: string[] = [];

  @ApiPropertyOptional({
    minimum: 1,
    default: DEFAULT_PAGE,
  })
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @IsOptional()
  readonly page?: number = DEFAULT_PAGE;

  @ApiPropertyOptional({
    minimum: 1,
    maximum: MAX_LIMIT,
    default: DEFAULT_LIMIT,
  })
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(MAX_LIMIT)
  @IsOptional()
  readonly limit?: number = DEFAULT_LIMIT;

  get skip(): number {
    return (this.page - 1) * this.limit;
  }

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  readonly q?: string = '';
}
