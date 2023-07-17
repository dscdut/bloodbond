import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Administrator } from './administrator.entity';
import { Campaign } from './campaign.entity';
import { User } from './user.entity';

@Index('donation_info_pkey', ['id'], { unique: true })
@Entity('donation_info', { schema: 'public' })
export class DonationInfo {
  @PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
  id: number;

  @Column('date', { name: 'donation_date' })
  donationDate: string;

  @Column('integer', { name: 'amount' })
  amount: number;

  @Column('integer', { name: 'status', default: () => '0' })
  status: number;

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
    () => Administrator,
    (administrator) => administrator.donationInfos,
  )
  @JoinColumn([{ name: 'admin_id', referencedColumnName: 'id' }])
  admin: Administrator;

  @ManyToOne(() => Campaign, (campaign) => campaign.donationInfos)
  @JoinColumn([{ name: 'campaign_id', referencedColumnName: 'id' }])
  campaign: Campaign;

  @ManyToOne(() => User, (user) => user.donationInfos)
  @JoinColumn([{ name: 'donor_id', referencedColumnName: 'id' }])
  donor: User;
}
