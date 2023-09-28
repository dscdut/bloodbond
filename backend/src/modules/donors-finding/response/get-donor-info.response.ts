import { ApiProperty } from '@nestjs/swagger';

export class GetDonorInfoResponse {
  @ApiProperty({
    type: Number,
    example: 1,
  })
  id: number;

  @ApiProperty({
    type: String,
    example: 'User 1',
  })
  name: string;

  @ApiProperty({
    type: String,
    example: 'link/to/avatar.png',
  })
  avatar: string;

  @ApiProperty({
    type: String,
    example: 'example@gmail.com',
  })
  email: string;

  @ApiProperty({
    type: String,
    example: '0704368399',
  })
  phoneNumber: string;

  @ApiProperty({
    type: 'object',
    example: {
      id: 1,
      name: 'A',
    },
  })
  bloodType: {
    id: number;
    name: string;
  };

  @ApiProperty({
    type: String,
    example: '123 Nguyen Van Linh, Da Nang, Viet Nam',
  })
  address: string;

  @ApiProperty({
    type: Number,
    example: 100.345,
  })
  distance: number;
}
