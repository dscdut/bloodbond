import { LoggerOptions } from 'typeorm';
import { LocalLogger } from '@core/loggers/env/local';
import { ProductionLogger } from '@core/loggers/env/production';
import { NodeEnv } from '@core/enum';
import { ConfigService } from '@nestjs/config';

const loggerMap = {
  [NodeEnv.DEVELOPMENT]: LocalLogger,
  [NodeEnv.PRODUCTION]: ProductionLogger,
};

const configService = new ConfigService();

export class LoggerFactory {
  static getInstance(
    loggerOptions: LoggerOptions,
    name: string,
  ): LocalLogger | ProductionLogger {
    const instance = loggerMap[configService.get('NODE_ENV')];
    return new instance(loggerOptions, name);
  }
}
