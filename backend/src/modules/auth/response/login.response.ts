import { ApiProperty } from '@nestjs/swagger';
import { USER_ROLE } from '@shared/enum/user.enum';

export class LoginResponse {
  @ApiProperty({
    type: String,
    example: 'example@gmail.com',
  })
  email: string;

  @ApiProperty({
    type: String,
    example: 'eyjdqoidjoqjdoi',
  })
  token: string;

  @ApiProperty({
    type: String,
    example: 1,
  })
  role: USER_ROLE;
}
