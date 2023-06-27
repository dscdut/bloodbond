import { Injectable, PipeTransform } from '@nestjs/common';
import { PageOptionsDto } from '../dto/page-option.dto';
import { IQuerySchema } from '../interface/query-schema.interface';
import { PaginateTransformDto } from '../dto/paginate-transformer.dto';

/**
 * @note this pipe is used to transform the query params to the query builder options to paginate the data
 */
@Injectable()
export class PaginateTransformPipe implements PipeTransform {
  constructor(private readonly paginateSchema: IQuerySchema) {}

  transform(pageOptionsDto: PageOptionsDto): PaginateTransformDto {
    const content = new PaginateTransformDto();
    content
      .setMain(this.paginateSchema.main)
      .setAssociates(this.paginateSchema.associates)
      .setPaginate(pageOptionsDto.page, pageOptionsDto.limit)
      .addSorts(this.paginateSchema.sorts, pageOptionsDto.order)
      .addFilters(this.paginateSchema.filters, pageOptionsDto.filters)
      .addSearch(pageOptionsDto.q, this.paginateSchema.searchCriteria);

    return content;
  }
}
