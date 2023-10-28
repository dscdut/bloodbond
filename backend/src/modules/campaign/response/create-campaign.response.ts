import { ApiProperty } from '@nestjs/swagger';

export class CreatedCampaignResponse {
  @ApiProperty({
    type: 'number',
    example: 1,
  })
  id: number;

  @ApiProperty({
    type: 'string',
    example: 'Campaign Name',
  })
  name: string;

  @ApiProperty({
    type: 'string',
    example: '2021-01-01',
  })
  startDate: string;

  @ApiProperty({
    type: 'string',
    example: '2021-01-02',
  })
  endDate: string;

  @ApiProperty({
    type: 'string',
    example: 'Campaign Address',
  })
  address: string;

  @ApiProperty({
    type: 'string',
    example: 'Campaign Description',
  })
  description: string;

  @ApiProperty({
    type: 'string',
    example: 'Campaign Blood Recipient Facility',
  })
  bloodRecipientFacility: string;
}
