import {
  BaseEntity,
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { NotificationRecipient } from './notification_recipient.entity';
import { Event } from './event.entity';

@Index('notifications_pkey', ['id'], { unique: true })
@Entity('notifications', { schema: 'public' })
export class Notification extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
  id: number;

  @Column('text', { name: 'content' })
  content: string;

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

  @OneToMany(
    () => NotificationRecipient,
    (notificationRecipient) => notificationRecipient.notification,
  )
  notificationRecipients: NotificationRecipient[];

  @ManyToOne(() => Event, (event) => event.notifications, {
    onDelete: 'SET NULL',
  })
  @JoinColumn([{ name: 'event_id', referencedColumnName: 'id' }])
  event: Event;
}
