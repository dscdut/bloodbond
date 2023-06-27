/* eslint-disable @typescript-eslint/naming-convention */
import { SetMetadata, applyDecorators, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { ApiBearerAuth } from '@nestjs/swagger';
import { USER_ROLE } from '@shared/enum/user.enum';
import { RolesGuard } from './roles.guard';

export const ROLES_KEY = 'roles';
export const Roles = (...roles: USER_ROLE[]) => SetMetadata(ROLES_KEY, roles);

export function AuthorizeGuard(roles: USER_ROLE[]) {
  return applyDecorators(
    ApiBearerAuth('token'),
    UseGuards(AuthGuard('jwt')),
    Roles(...roles),
    UseGuards(RolesGuard),
  );
}

export function AuthenticateGuard() {
  return applyDecorators(ApiBearerAuth('token'), UseGuards(AuthGuard('jwt')));
}
