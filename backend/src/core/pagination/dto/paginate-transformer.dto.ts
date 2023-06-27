import { ApiPropertyOptional } from '@nestjs/swagger';
import { Order } from '../constant/order.constant';
import { IsNumber } from 'class-validator';
import { AssociateOptions } from '../interface/query-schema.interface';
import { HttpException, HttpStatus } from '@nestjs/common';
import { FilterSign } from '../enum/filter-sign.enum';

type SortOptions = {
  sortColumn: string;
  order: Order;
  columns: Record<string, string>[];
};

type FilterOptions = {
  column: string;
  sign: string;
  value: string;
};

type SearchOptions = {
  q: string;
  columns: string[];
};

export class PaginateTransformDto {
  @ApiPropertyOptional()
  main?: string[];

  @ApiPropertyOptional()
  sorts?: SortOptions;

  @ApiPropertyOptional()
  filters?: FilterOptions[] = [];

  @ApiPropertyOptional()
  search?: SearchOptions;

  @ApiPropertyOptional()
  @IsNumber()
  page?: number;

  @ApiPropertyOptional()
  @IsNumber()
  limit?: number;

  @ApiPropertyOptional()
  associates?: AssociateOptions[] = [];

  get skip(): number {
    return (this.page - 1) * this.limit;
  }

  /**
   *
   * @param main columns need to select
   */
  setMain(main: string[]) {
    this.main = main;
    return this;
  }

  setPaginate(page: number, limit: number) {
    this.page = page;
    this.limit = limit;

    return this;
  }

  /**
   *
   * @param associates associated tables to join
   */
  setAssociates(associates: AssociateOptions[]) {
    if (Array.isArray(associates) && associates.length > 0) {
      this.associates = associates;
    }

    return this;
  }

  /**
   *
   * @param sorts sortable columns
   * @param orderString order string from the query params e.g: +id or -id // + for ascending and - for descending
   */
  addSorts(sorts: Record<string, string>[], orderString: string) {
    const sortColumn = orderString.slice(1);

    const isSortableColumn = sorts.find(
      (column) => column[sortColumn] !== undefined,
    );

    if (!isSortableColumn) {
      throw new HttpException(
        `Sort column: ${sortColumn} is not sortable`,
        HttpStatus.BAD_REQUEST,
      );
    }

    this.sorts = {
      sortColumn: isSortableColumn[sortColumn],
      order: Order[orderString[0]],
      columns: sorts,
    };

    return this;
  }

  /**
   *
   * @param filters filterable columns
   * @param filterString filter string from the query params e.g: role|$eq|admin
   */
  addFilters(filters: Record<string, string>[], filterString: string[]) {
    if (!Array.isArray(filterString) || filterString.length === 0) {
      return this;
    }

    filterString.forEach((filter) => {
      const [column, sign, value] = filter.split('|');

      const isFilterableColumn = filters.find(
        (filter) => filter[column] !== undefined,
      );

      if (!isFilterableColumn) {
        throw new HttpException(
          `Filter column: ${column} is not filterable`,
          HttpStatus.BAD_REQUEST,
        );
      }

      this.filters.push({
        column: isFilterableColumn[column],
        sign: FilterSign[sign],
        value,
      });
    });

    return this;
  }

  /**
   *
   * @param q search string from the query params
   * @param columns columns to search
   */
  addSearch(q: string, columns: string[]) {
    this.search = {
      q,
      columns,
    };

    return this;
  }
}
