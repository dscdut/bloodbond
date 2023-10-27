import { Db } from 'mongodb';

module.exports = {
  async up(db: Db) {
    await db.createCollection('user_devices', {
      validator: {
        $jsonSchema: {
          bsonType: 'object',
          required: ['userId', 'deviceToken'],
          properties: {
            userId: {
              bsonType: 'string',
              description: 'must be a string and is required',
            },
            deviceToken: {
              bsonType: 'string',
              description: 'must be a string and is required',
            },
            settings: {
              bsonType: 'object',
            },
          },
        },
      },
    });
  },

  async down(db: Db) {
    await db.dropCollection('user_devices');
  },
};
