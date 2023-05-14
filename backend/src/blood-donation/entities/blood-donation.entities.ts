import {
  Column,
  CreateDateColumn,
  Entity,
  Index,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';
import { EntityHelper } from 'src/utils/entity-helper';
import { User } from 'src/users/entities/user.entity';

@Entity()
export class BloodDonation extends EntityHelper {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => User, {
    eager: true,
  })
  userId: string;

  @Index()
  @Column({ type: String, nullable: true })
  centerId: string | null;

  @Column({ type: Number, nullable: true })
  @Index()
  amount: number | null;

  @CreateDateColumn()
  requestDate: Date;

  @UpdateDateColumn()
  donationDate: Date;
}
