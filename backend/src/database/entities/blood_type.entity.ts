import {
  BaseEntity,
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { User } from './user.entity';

@Index('blood_types_pkey', ['id'], { unique: true })
@Entity('blood_types', { schema: 'public' })
export class BloodType extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
  id: number;

  @Column('character varying', { name: 'name', length: 10 })
  name: string;

  @OneToMany(() => User, (user) => user.bloodType)
  users: User[];
}
