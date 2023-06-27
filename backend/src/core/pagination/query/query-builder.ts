import { Brackets, SelectQueryBuilder } from 'typeorm';
import { PaginateTransformDto } from '../dto/paginate-transformer.dto';
import { BuilderType } from '../enum/builder-type.enum';

export class PaginateQueryBuilder<T> {
  private queryBuilder: SelectQueryBuilder<T>;
  private queryDocument: PaginateTransformDto = new PaginateTransformDto();
  private buildType: string;

  constructor(query, paginateTransformDto?: PaginateTransformDto) {
    this.queryBuilder = query;
    if (paginateTransformDto) {
      this.queryDocument.main = paginateTransformDto.main;
      this.queryDocument.associates = paginateTransformDto.associates;
      this.queryDocument.filters = paginateTransformDto.filters;
      this.queryDocument.sorts = paginateTransformDto.sorts;
      this.queryDocument.search = paginateTransformDto.search;
      this.queryDocument.page = paginateTransformDto.page;
      this.queryDocument.limit = paginateTransformDto.limit;
    }
  }

  static builder<U>(
    queryBuilder: SelectQueryBuilder<U>,
    paginateTransformDto: PaginateTransformDto,
  ) {
    const instance = new PaginateQueryBuilder<U>(
      queryBuilder,
      paginateTransformDto,
    );

    return {
      itemCount: instance.init(BuilderType.COUNT_RECORD),
      data: instance.init(BuilderType.SELECT),
    };
  }

  init = (buildType) => () => {
    this.buildType = buildType;
    return this;
  };

  clearJoin = () => {
    if (this.queryBuilder.expressionMap.joinAttributes.length > 0) {
      this.queryBuilder.expressionMap.joinAttributes = [];
    }
  };

  run(): Promise<number> | Promise<T[]> {
    if (this.queryDocument.associates.length > 0) {
      this.queryDocument.associates.forEach((associate) => {
        this.queryBuilder.leftJoinAndSelect(associate[0], associate[1]);
      });
    }

    if (this.queryDocument.main && this.queryDocument.main.length > 0) {
      this.queryBuilder.select(this.queryDocument.main);
    } else {
      this.queryBuilder.select();
    }

    if (this.queryDocument.sorts && this.queryDocument.sorts.columns) {
      this.queryBuilder.orderBy(
        this.queryDocument.sorts.sortColumn,
        this.queryDocument.sorts.order,
      );
    }

    if (this.queryDocument.filters.length > 0) {
      this.queryDocument.filters.forEach((filter) => {
        const randomSuffix = Math.random().toString(36).substring(7);
        this.queryBuilder.andWhere(
          `${filter.column} ${filter.sign} :${filter.column}${randomSuffix}`,
          {
            [filter.column + randomSuffix]: filter.value,
          },
        );
      });
    }

    if (this.queryDocument.search) {
      this.queryBuilder.andWhere(
        new Brackets((qb) => {
          for (const item of this.queryDocument.search.columns) {
            qb.orWhere(`${item} ILIKE :search`, {
              search: `%${this.queryDocument.search.q}%`,
            });
          }
        }),
      );
    }

    if (this.queryDocument.page && this.queryDocument.limit) {
      this.queryBuilder
        .skip(this.queryDocument.skip)
        .take(this.queryDocument.limit);
    }

    if (this.buildType === BuilderType.COUNT_RECORD) {
      return this.queryBuilder.getCount();
    } else if (this.buildType === BuilderType.SELECT) {
      return this.queryBuilder.getMany();
    }
  }
}
