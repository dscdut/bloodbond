import { ProjectLogger } from '@core/loggers';
import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  private readonly logger = new ProjectLogger('AppService');

  getHello(): string {
    return 'Hello World!';
  }
}
