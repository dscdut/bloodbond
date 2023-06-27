import { PageOptionsDto } from '@core/pagination/dto/page-option.dto';
import { PageDto } from '@core/pagination/dto/page.dto';
import { User } from '@database/entities';
import { AuthenticateGuard } from '@modules/auth/guard/roles.decorator';
import { Controller, Get, HttpCode, HttpStatus, Query } from '@nestjs/common';
import { ApiOperation, ApiResponse } from '@nestjs/swagger';
import { CurrentUser } from '@shared/decorator/user.decorator';
import { UserService } from './user.service';
import { PaginateTransformPipe } from '@core/pagination/transformer/paginate-transform.pipe';
import { UserPaginateSchema } from './query/user-paginate.schema';
import { PaginateTransformDto } from '@core/pagination/dto/paginate-transformer.dto';

@Controller('users')
export class UserController {
  constructor(private readonly userService: UserService) {}
  @Get('me')
  @AuthenticateGuard()
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    tags: ['user'],
    operationId: 'getMe',
    summary: 'Get current user',
    description: 'Get current user',
  })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Successful',
  })
  async getMe(@CurrentUser('id') id: number): Promise<Partial<User>> {
    return this.userService.getMe(id);
  }

  @Get()
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    tags: ['user'],
    operationId: 'getAllUser',
    summary: 'Get all user',
    description: 'Get all user',
  })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Successful',
    type: PageDto,
  })
  async findMany(
    @Query(new PaginateTransformPipe(UserPaginateSchema))
    pageOptionsDto: PageOptionsDto,
  ): Promise<PageDto<User>> {
    const paginateTransformDto: PaginateTransformDto =
      pageOptionsDto as unknown as PaginateTransformDto;

    return this.userService.findAll(paginateTransformDto);
  }
}
