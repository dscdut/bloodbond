import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Transform } from 'class-transformer';
import { ObjectId, Document } from 'mongoose';

@Schema({ collection: 'user_devices', timestamps: true })
export class UserDevice {
  @Transform(({ value }) => value.toString())
  _id: ObjectId;

  @Prop({ required: true })
  userId: string;

  @Prop({ required: true })
  deviceToken: string;

  @Prop({ type: Object, default: {} })
  settings: Record<string, unknown>;
}

export const UserDeviceSchema = SchemaFactory.createForClass(UserDevice);
export type UserDeviceDocument = UserDevice & Document;
