/* eslint-disable no-console */
import { Logger, LoggerOptions, QueryRunner } from 'typeorm';
import { createLogger, Logger as WinstonLogger, format } from 'winston';

import * as util from 'util';
import { Format } from 'logform';
import { LoggerLevel } from '@core/type/logger-level';
import * as DailyRotateFile from 'winston-daily-rotate-file';
import { Console } from 'winston/lib/winston/transports';
/**
 * Custom file logger
 */
export class LocalLogger implements Logger {
  private readonly queryLogger: WinstonLogger;
  private readonly coreLogger: WinstonLogger;
  private readonly customFormat: Format;
  private readonly loggerOptions: LoggerOptions;

  constructor(loggerOptions: LoggerOptions, name: string) {
    this.loggerOptions = loggerOptions;
    this.customFormat = format.printf(
      ({ timestamp, level, message, ...extra }) =>
        `${timestamp} [${name}][${level}]: ${message} ${
          Object.keys(extra).length ? util.inspect(extra) : ''
        }`,
    );
    const options = (filename: string) => {
      const transports = [
        new DailyRotateFile({
          filename: filename + '-%DATE%.log',
          datePattern: 'DD-MM-YYYY',
          zippedArchive: true,
          maxSize: '50m',
          maxFiles: '15',
        }),
        new Console({
          format: format.combine(
            format.simple(),
            format.splat(),
            format.timestamp({
              format: 'DD-MM-YYYY HH:mm:ss',
            }),
            format.colorize(),
            this.customFormat,
          ),
        }),
      ];

      return {
        transports,
        format: this.customFormat,
      };
    };

    this.queryLogger = createLogger(options('./logs/queries.log'));
    this.coreLogger = createLogger(options('./logs/core.log'));
  }

  /**
   * Logs query and parameters used in it.
   */
  logQuery(query: string, parameters?: any[], _queryRunner?: QueryRunner) {
    const message = `${query} - ${
      parameters ? JSON.stringify(parameters) : ''
    }`;

    if (this.isLevelAllowed('query')) this.queryWrite('info', message);
  }

  /**
   * Logs query that is failed.
   */
  logQueryError(
    error: string | Error,
    query: string,
    parameters?: any[],
    _queryRunner?: QueryRunner,
  ) {
    const message = `${query} - ${
      parameters ? JSON.stringify(parameters) : ''
    } - Error: ${error}`;

    if (this.isLevelAllowed('error')) {
      this.coreWrite('error', message);
    }
  }

  /**
   * Logs query that is slow
   */
  logQuerySlow(
    time: number,
    query: string,
    parameters?: any[],
    _queryRunner?: QueryRunner,
  ) {
    const message = `${query} - ${time} - ${
      parameters ? JSON.stringify(parameters) : ''
    }`;
    if (this.isLevelAllowed('warn')) this.queryWrite('warn', message);
  }

  /**
   * Logs events from the schema build process.
   */
  logSchemaBuild(message: string, _queryRunner?: QueryRunner) {
    if (this.isLevelAllowed('schema')) this.queryWrite('info', message);
  }

  /**
   * Logs events from the migrations run process.
   */
  logMigration(message: string, _queryRunner?: QueryRunner) {
    if (this.isLevelAllowed('migration')) this.queryWrite('info', message);
  }

  /**
   * Perform logging using given logger, or by default to the console. Log has its own level and message.
   */
  log(
    level: 'log' | 'info' | 'warn' | 'error',
    message: any,
    _queryRunner?: QueryRunner,
  ) {
    switch (level) {
      case 'log':
        if (this.isLevelAllowed('log')) this.coreWrite(level, message);
        break;
      case 'info':
        if (this.isLevelAllowed('info')) this.coreWrite(level, message);
        break;
      case 'warn':
        if (this.isLevelAllowed('warn')) this.coreWrite(level, message);
        break;
      case 'error':
        if (this.isLevelAllowed('error')) this.coreWrite(level, message);
        break;
    }
  }

  /**
   * Logs message to core log file
   */
  private coreWrite(level: 'log' | 'info' | 'warn' | 'error', message: any) {
    this.coreLogger.log({
      level,
      message,
      timestamp: new Date().toISOString(),
    });
  }

  /**
   * Logs message to query log file
   */
  private queryWrite(level: 'log' | 'info' | 'warn' | 'error', message: any) {
    this.queryLogger.log({
      level,
      message: message,
      timestamp: new Date().toISOString(),
    });
  }

  private isLevelAllowed(level: LoggerLevel) {
    return (
      this.loggerOptions === 'all' ||
      (Array.isArray(this.loggerOptions) &&
        this.loggerOptions.indexOf(level) !== -1)
    );
  }
}
