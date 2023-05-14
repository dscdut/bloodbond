import {
  Column,
  DeleteDateColumn,
  Entity,
  Index,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';
import { EntityHelper } from 'src/utils/entity-helper';
import { Expose } from 'class-transformer';

@Entity()
export class DonationCenter extends EntityHelper {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: String, unique: true, nullable: true })
  @Expose({ groups: ['admin'] })
  email: string | null;

  @Index()
  @Column({ type: String, nullable: true })
  name: string | null;

  @Index()
  @Column({ type: String, nullable: true })
  phone: string | null;

  @Index()
  @Column({ type: String, nullable: true })
  address: string | null;

  @Index()
  @Column({ type: String, nullable: true })
  photoId: string | null;

  @UpdateDateColumn()
  createAt: Date;

  @DeleteDateColumn()
  updateAt: Date;
}
