import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Administrator } from './administrator.entity';
import { DonationInfo } from './donation_info.entity';

@Index('campaigns_pkey', ['id'], { unique: true })
@Entity('campaigns', { schema: 'public' })
export class Campaign {
  @PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
  id: number;

  @Column('character varying', { name: 'name', length: 255 })
  name: string;

  @Column('date', { name: 'start_date' })
  startDate: string;

  @Column('date', { name: 'end_date' })
  endDate: string;

  @Column('character varying', { name: 'address', length: 255 })
  address: string;

  @Column('text', { name: 'description', nullable: true })
  description: string | null;

  @Column('character varying', {
    name: 'blood_recipient_facility',
    length: 255,
  })
  bloodRecipientFacility: string;

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

  @ManyToOne(() => Administrator, (administrator) => administrator.campaigns)
  @JoinColumn([{ name: 'admin_id', referencedColumnName: 'id' }])
  admin: Administrator;

  @OneToMany(() => DonationInfo, (donationInfo) => donationInfo.campaign)
  donationInfos: DonationInfo[];
}
