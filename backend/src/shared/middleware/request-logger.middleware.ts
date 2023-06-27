import { ProjectLogger } from '@core/loggers';
import { NextFunction } from 'express';

export const requestLoggerMiddleware = (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  const logger = new ProjectLogger('RequestLoggerMiddleware');
  const { method, url, body } = req;
  logger.info(`Request: ${method} ${url} ${JSON.stringify(body)}`);
  next();
};
