import { ConfigService } from '@nestjs/config';
import { LoggerFactory } from './env/factory';

/**
 * Logger service, use this class to log something in your project
 */
export class ProjectLogger {
  private configService = new ConfigService();
  private readonly instance: any;
  constructor(name: string) {
    this.instance = LoggerFactory.getInstance(
      this.configService.get('SYSTEM_LOG_INFO'),
      name,
    );
  }
  exception(message: string) {
    this.instance.log('error', message);
  }

  info(message: string) {
    this.instance.log('info', message);
  }

  warn(message: string) {
    this.instance.log('warn', message);
  }
}
