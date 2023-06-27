export type AssociateOptions = [string, string, string?];

export interface IQuerySchema {
  main?: string[];
  sorts?: Record<string, string>[];
  filters?: Record<string, string>[];
  associates?: AssociateOptions[];
  searchCriteria?: string[];
}
