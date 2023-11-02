import { Column, Entity, Index, JoinColumn, ManyToOne } from 'typeorm';
import { Notification } from './notification.entity';
import { User } from './user.entity';

@Index('notification_recipients_pkey', ['notificationId', 'recipientId'], {
  unique: true,
})
@Entity('notification_recipients', { schema: 'public' })
export class NotificationRecipient {
  @Column('integer', { primary: true, name: 'notification_id' })
  notificationId: number;

  @Column('integer', { primary: true, name: 'recipient_id' })
  recipientId: number;

  @Column('timestamp with time zone', { name: 'read_at', nullable: true })
  readAt: Date | null;

  @Column('jsonb', { name: 'channels', default: [] })
  channels: object;

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

  @ManyToOne(
    () => Notification,
    (notification) => notification.notificationRecipients,
    { onDelete: 'RESTRICT' },
  )
  @JoinColumn([{ name: 'notification_id', referencedColumnName: 'id' }])
  notification: Notification;

  @ManyToOne(() => User, (user) => user.notificationRecipients, {
    onDelete: 'RESTRICT',
  })
  @JoinColumn([{ name: 'recipient_id', referencedColumnName: 'id' }])
  recipient: User;
}
