import { Db } from 'mongodb';

module.exports = {
  async up(db: Db) {
    await db.createCollection('fcm_logs', {
      validator: {
        $jsonSchema: {
          bsonType: 'object',
          properties: {
            device_token: {
              bsonType: 'string',
              description: 'must be a string and is required',
            },
          },
        },
      },
    });
  },

  async down(db: Db) {
    await db.dropCollection('fcm_logs');
  },
};
