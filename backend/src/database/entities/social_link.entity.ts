import { Column, Entity, Index, JoinColumn, ManyToOne } from 'typeorm';
import { User } from './user.entity';

@Index('social_links_pkey', ['link', 'userId'], { unique: true })
@Index('social_links_link_key', ['link'], { unique: true })
@Entity('social_links', { schema: 'public' })
export class SocialLink {
  @Column('integer', { primary: true, name: 'user_id' })
  userId: number;

  @Column('enum', {
    name: 'type',
    enum: ['facebook', 'instagram', 'twitter', 'zalo', 'telegram'],
  })
  type: 'facebook' | 'instagram' | 'twitter' | 'zalo' | 'telegram';

  @Column('character varying', { primary: true, name: 'link', length: 255 })
  link: string;

  @ManyToOne(() => User, (user) => user.socialLinks)
  @JoinColumn([{ name: 'user_id', referencedColumnName: 'id' }])
  user: User;
}
