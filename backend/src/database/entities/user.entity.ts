import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  BeforeInsert,
  BeforeUpdate,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import * as argon2 from 'argon2';
import { USER_ROLE } from '@shared/enum/user.enum';
import { AuthProvidersEnum } from '@shared/enum/auth-providers.enum';
import { Media } from './media.entity';
@Entity({ name: 'users' })
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: true, unique: true })
  email: string;

  @Column({ nullable: true })
  password: string;

  @Column({ default: USER_ROLE.USER })
  role: USER_ROLE;

  @Column({ default: AuthProvidersEnum.email })
  provider: string;

  @Column({ nullable: true })
  social_id: string;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  created_at: Date;

  @ManyToOne(() => Media, (media) => media.users)
  @JoinColumn({ name: 'avatar_id' })
  avatar: Media;

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
