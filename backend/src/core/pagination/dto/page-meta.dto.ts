import { ApiProperty } from '@nestjs/swagger';
import { IPageMetaDtoParameters } from '../interface/page-meta-dto-parameter.interface';

export class PageMetaDto {
  @ApiProperty()
  readonly page: number;

  @ApiProperty()
  readonly limit: number;

  @ApiProperty()
  readonly itemCount: number;

  @ApiProperty()
  readonly pageCount: number;

  @ApiProperty()
  readonly hasPreviousPage: boolean;

  @ApiProperty()
  readonly hasNextPage: boolean;

  constructor({ paginateTransformDto, itemCount }: IPageMetaDtoParameters) {
    this.page = paginateTransformDto.page;
    this.limit = paginateTransformDto.limit;
    this.itemCount = itemCount;
    this.pageCount = Math.ceil(this.itemCount / this.limit);
    this.hasPreviousPage = this.page > 1;
    this.hasNextPage = this.page < this.pageCount;
  }
}
