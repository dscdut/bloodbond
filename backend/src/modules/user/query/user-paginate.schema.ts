import { IQuerySchema } from '@core/pagination/interface/query-schema.interface';

export const UserPaginateSchema: IQuerySchema = {
  main: ['user.id', 'user.email', 'user.role', 'user.created_at', 'avatar.url'],
  sorts: [
    { id: 'user.id' },
    { email: 'user.email' },
    { created_at: 'user.created_at' },
  ],
  filters: [{ role: 'user.role' }],
  associates: [['user.avatar', 'avatar']],
  searchCriteria: ['user.email'],
};
