import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Campaign } from './campaign.entity';
import { DonationInfo } from './donation_info.entity';

@Index('administrators_email_key', ['email'], { unique: true })
@Index('administrators_pkey', ['id'], { unique: true })
@Index('administrators_username_key', ['username'], { unique: true })
@Entity('administrators', { schema: 'public' })
export class Administrator {
  @PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
  id: number;

  @Column('character varying', { name: 'email', unique: true, length: 255 })
  email: string;

  @Column('character varying', { name: 'username', unique: true, length: 255 })
  username: string;

  @Column('character varying', { name: 'password', length: 255 })
  password: string;

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

  @Column('integer', { name: 'role', default: () => '0' })
  role: number;

  @OneToMany(() => Campaign, (campaign) => campaign.admin)
  campaigns: Campaign[];

  @OneToMany(() => DonationInfo, (donationInfo) => donationInfo.admin)
  donationInfos: DonationInfo[];
}
