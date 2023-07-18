import {
  BeforeInsert,
  BeforeUpdate,
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { BloodCommit } from './blood_commit.entity';
import { DonationInfo } from './donation_info.entity';
import { SocialLink } from './social_link.entity';
import { BloodType } from './blood_type.entity';
import * as argon2 from 'argon2';

@Index('users_citizenship_number_key', ['citizenshipNumber'], { unique: true })
@Index('users_email_key', ['email'], { unique: true })
@Index('users_pkey', ['id'], { unique: true })
@Index('users_phone_number_key', ['phoneNumber'], { unique: true })
@Entity('users', { schema: 'public' })
export class User {
  @PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
  id: number;

  @Column('character varying', { name: 'name', length: 255 })
  name: string;

  @Column('character varying', { name: 'avatar', nullable: true, length: 255 })
  avatar: string | null;

  @Column('character varying', { name: 'email', unique: true, length: 255 })
  email: string;

  @Column('character varying', { name: 'password', length: 255 })
  password: string;

  @Column('date', { name: 'birthdate', nullable: true })
  birthdate: string | null;

  @Column('character varying', {
    name: 'phone_number',
    nullable: true,
    unique: true,
    length: 20,
  })
  phoneNumber: string | null;

  @Column('character varying', {
    name: 'citizenship_number',
    nullable: true,
    unique: true,
    length: 50,
  })
  citizenshipNumber: string | null;

  @Column('integer', { name: 'blood_type_id', nullable: true })
  bloodTypeId: number | null;

  @Column('character varying', { name: 'address', nullable: true, length: 255 })
  address: string | null;

  @Column({
    type: 'geometry',
    spatialFeatureType: 'Point',
    name: 'geom',
    nullable: true,
  })
  geom: { type: string; coordinates: [number, number] } | null;

  @Column('text', { name: 'refresh_token', nullable: true, array: true })
  refreshToken: string[] | null;

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

  @OneToMany(() => BloodCommit, (bloodCommit) => bloodCommit.donor)
  donors: BloodCommit[];

  @OneToMany(() => BloodCommit, (bloodCommit) => bloodCommit.recipient)
  recipients: BloodCommit[];

  @OneToMany(() => DonationInfo, (donationInfo) => donationInfo.donor)
  donationInfos: DonationInfo[];

  @OneToMany(() => SocialLink, (socialLink) => socialLink.user)
  socialLinks: SocialLink[];

  @ManyToOne(() => BloodType, (bloodType) => bloodType.users)
  @JoinColumn([{ name: 'blood_type_id', referencedColumnName: 'id' }])
  bloodType: BloodType;

  @BeforeInsert()
  async hashPassword() {
    if (!this.password) return;
    this.password = await argon2.hash(this.password);
  }

  @BeforeUpdate()
  async updatePassword() {
    if (!this.password) return;
    this.password = await argon2.hash(this.password);
  }
}
