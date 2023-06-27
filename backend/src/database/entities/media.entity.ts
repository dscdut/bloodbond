import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { User } from './user.entity';

@Entity({ name: 'media' })
export class Media {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ nullable: true })
  public_id: string;

  @Column({ nullable: true })
  url: string;

  @OneToMany(() => User, (user) => user.avatar)
  users: User[];
}
