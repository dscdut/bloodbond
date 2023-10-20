import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import {
  NestExpressApplication,
  ExpressAdapter,
} from '@nestjs/platform-express';
import { ConfigService } from '@nestjs/config';

async function bootstrap(): Promise<NestExpressApplication> {
  const app = await NestFactory.create<NestExpressApplication>(
    AppModule,
    new ExpressAdapter(),
    {
      cors: true,
    },
  );
  app.enableCors();
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      stopAtFirstError: true,
      transform: true,
    }),
  );

  app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Accept');
    next();
  });

  const config = app.get<ConfigService>(ConfigService);

  await app.listen(config.get('PORT'), async () => {
    console.log(`Application is running on: ${await app.getUrl()}`);
  });

  return app;
}
bootstrap();
