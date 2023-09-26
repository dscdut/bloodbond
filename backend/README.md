# nestjs-boilerplate

<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="200" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

<p align="center">Nestjs Boilerplate</p>

## Description

Nestjs boilerplate.

## Installation

```bash
# install packages
$ npm install

# init database
$ docker-compose up
```

## Migration

```bash
# run migrations
$ npm run typeorm:run-migration

# generate migrations
$ npm run typeorm:generate-migration --name=some-name

# if script above doesn't work, try using git bash, change $npm_config_name in package.json to %name% and run the following script:
$ name=migration-name npm run typeorm:generate-migration
```

## Generate entity from database

```bash
$ npm run gen-entity-local
```

All the entities will be created in `src/database/entities`

## Seeding

### Creating seeds

1. Create seed file with `npm run seed:create -- --name=Demo`. Where `Demo` is name of entity.
2. Go to `src/database/seeds/demo/demo-seed.service.ts`.
3. In `run` method extend your logic.
4. Run [npm run seed:run](#run-seed)

### Run seed

```bash
$ npm run seed:run
```

## Generate module, controller & service

```bash
# Generate module
$ name=demo npm run module:generate

# Generate controller
$ name=demo npm run controller:generate

# Generate service
$ name=demo npm run service:generate
```

Module, controller & service of Demo will be created in `src/modules/demo`

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```
