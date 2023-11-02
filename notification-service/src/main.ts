import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import {
  NestExpressApplication,
  ExpressAdapter,
} from '@nestjs/platform-express';
import { ConfigService } from '@nestjs/config';
import { MicroserviceOptions, Transport } from '@nestjs/microservices';

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

  // user devices service
  const userDevicesServiceUser = config.get('RABBITMQ_USER');
  const userDevicesServicePassword = config.get('RABBITMQ_PASSWORD');
  const userDevicesServiceHost = config.get('RABBITMQ_HOST');
  const queueName = config.get('USER_DEVICES_QUEUE');

  app.connectMicroservice<MicroserviceOptions>({
    transport: Transport.RMQ,
    options: {
      urls: [
        `amqp://${userDevicesServiceUser}:${userDevicesServicePassword}@${userDevicesServiceHost}`,
      ],
      queue: queueName,
      queueOptions: {
        durable: true,
      },
    },
  });

  // notification service
  const notificationServiceUser = config.get('RABBITMQ_USER');
  const notificationServicePassword = config.get('RABBITMQ_PASSWORD');
  const notificationServiceHost = config.get('RABBITMQ_HOST');
  const notificationServiceQueueName = config.get('NOTIFICATION_QUEUE');

  app.connectMicroservice<MicroserviceOptions>({
    transport: Transport.RMQ,
    options: {
      urls: [
        `amqp://${notificationServiceUser}:${notificationServicePassword}@${notificationServiceHost}`,
      ],
      queue: notificationServiceQueueName,
      queueOptions: {
        durable: true,
      },
    },
  });

  app.startAllMicroservices();
  app.init();
  return app;
}

bootstrap();
