import { ArgumentsHost, Catch, HttpServer } from '@nestjs/common';
import { AbstractHttpAdapter, BaseExceptionFilter } from '@nestjs/core';
import * as Sentry from '@sentry/node';
import { DiscordBot } from 'src/helpers/discord.bot';
import { config } from 'dotenv';
import { ConfigService } from '@nestjs/config';

config();
const configService = new ConfigService();

const discordBot = new DiscordBot(
  configService.get('DISCORD_WEBHOOK'),
  configService.get('DISCORD_BOT_NAME'),
  configService.get('DISCORD_BOT_AVATAR_URL'),
);

@Catch()
export class SentryFilter extends BaseExceptionFilter {
  async handleUnknownError(
    exception: any,
    host: ArgumentsHost,
    applicationRef: HttpServer<any, any> | AbstractHttpAdapter<any, any, any>,
  ): Promise<void> {
    await discordBot.logErrors(
      `**${exception.toString()}**\n\n**Stack Trace:**\n\`\`\`${
        exception.stack
      }\`\`\`
      `,
    );
    Sentry.captureException(exception);
    super.handleUnknownError(exception, host, applicationRef);
  }
}
