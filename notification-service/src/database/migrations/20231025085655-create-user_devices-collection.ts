import { Db } from 'mongodb';

module.exports = {
  async up(db: Db) {
    // create user_devices collection with 2 fields user_id and device_token
    await db.createCollection('user_devices', {
      validator: {
        $jsonSchema: {
          bsonType: 'object',
          required: ['user_id', 'device_token', 'settings'],
          properties: {
            user_id: {
              bsonType: 'string',
              description: 'must be a string and is required',
            },
            device_token: {
              bsonType: 'string',
              description: 'must be a string and is required',
            },
            settings: {
              bsonType: 'object',
              description: 'must be a object and is required',
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
