import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { User } from './user.entity';

@Index('blood_commits_pkey', ['id'], { unique: true })
@Entity('blood_commits', { schema: 'public' })
export class BloodCommit {
  @PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
  id: number;

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

  @Column('integer', { name: 'status', default: () => '0' })
  status: number;

  @ManyToOne(() => User, (user) => user.bloodCommits)
  @JoinColumn([{ name: 'donor_id', referencedColumnName: 'id' }])
  donor: User;

  @ManyToOne(() => User, (user) => user.bloodCommits2)
  @JoinColumn([{ name: 'recipient_id', referencedColumnName: 'id' }])
  recipient: User;
}
