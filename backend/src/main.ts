import { SentryFilter } from './core/filters/sentry-filter';
import { ValidationPipe } from '@nestjs/common';
import { HttpAdapterHost, NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { GlobalExceptionsFilter } from '@core/filters/global-exception-filter';
import { ProjectLogger } from '@core/loggers';
import { ConfigService } from '@nestjs/config';
import { requestLoggerMiddleware } from '@shared/middleware/request-logger.middleware';
import { setupSwagger } from './setup-swagger';
import {
  ExpressAdapter,
  NestExpressApplication,
} from '@nestjs/platform-express';
import * as Sentry from '@sentry/node';

const logger = new ProjectLogger('bootstrap');

async function bootstrap(): Promise<NestExpressApplication> {
  const app = await NestFactory.create<NestExpressApplication>(
    AppModule,
    new ExpressAdapter(),
    { cors: true },
  );
  app.setGlobalPrefix('/api');
  app.use(requestLoggerMiddleware);
  app.enableCors();
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      stopAtFirstError: true,
      transform: true,
    }),
  );

  setupSwagger(app);

  app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Accept');
    next();
  });

  const config = app.get<ConfigService>(ConfigService);

  Sentry.init({
    dsn: config.get('SENTRY_DSN'),
  });

  const { httpAdapter } = app.get(HttpAdapterHost);
  app.useGlobalFilters(
    new GlobalExceptionsFilter(config),
    new SentryFilter(httpAdapter),
  );

  await app.listen(config.get('PORT'), async () => {
    logger.info(`Application is running on: ${await app.getUrl()}`);
  });

  return app;
}
bootstrap();
