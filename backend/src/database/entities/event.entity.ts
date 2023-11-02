import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Notification } from './notification.entity';

@Index('events_pkey', ['id'], { unique: true })
@Entity('events', { schema: 'public' })
export class Event {
  @PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
  id: number;

  @Column('smallint', { name: 'entity_type' })
  entityType: number;

  @Column('integer', { name: 'entity_id' })
  entityId: number;

  @Column('smallint', { name: 'event_type' })
  eventType: number;

  @Column('timestamp with time zone', {
    name: 'created_at',
    nullable: true,
    default: () => 'CURRENT_TIMESTAMP',
  })
  createdAt: Date | null;

  @Column('timestamp with time zone', {
    name: 'updated_at',
    nullable: true,
    default: () => 'CURRENT_TIMESTAMP',
  })
  updatedAt: Date | null;

  @OneToMany(() => Notification, (notification) => notification.event)
  notifications: Notification[];
}
