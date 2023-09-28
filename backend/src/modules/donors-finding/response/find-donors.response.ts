import { ApiProperty } from '@nestjs/swagger';

export class FindDonorsResponse {
  @ApiProperty({
    type: Number,
    example: 1,
  })
  id: number;

  @ApiProperty({
    type: String,
    example: '123 Nguyen Van Linh, Da Nang, Viet Nam',
  })
  address: string;

  @ApiProperty({
    type: Object,
    example: {
      type: 'Point',
      coordinates: [108.22428131103516, 16.05922985076915],
    },
  })
  geom: {
    type: string;
    coordinates: number[];
  };

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
}
