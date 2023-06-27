---
to: src/database/seeds/<%= h.inflection.transform(name, ['underscore', 'dasherize']) %>/<%= h.inflection.transform(name, ['underscore', 'dasherize']) %>-seed.module.ts
---
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { <%= name %> } from 'src/database/entities/<%= h.inflection.transform(name, ['underscore', 'dasherize']) %>.entity';
import { <%= name %>SeedService } from './<%= h.inflection.transform(name, ['underscore', 'dasherize']) %>-seed.service';

@Module({
  imports: [TypeOrmModule.forFeature([<%= name %>])],
  providers: [<%= name %>SeedService],
  exports: [<%= name %>SeedService],
})
export class <%= name %>SeedModule {}
