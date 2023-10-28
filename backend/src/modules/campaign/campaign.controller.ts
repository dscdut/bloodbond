import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  Patch,
  Post,
} from '@nestjs/common';
import { CampaignService } from './campaign.service';
import { ApiOperation, ApiResponse } from '@nestjs/swagger';
import { CreatedCampaignResponse } from './response/create-campaign.response';
import { CreateCampaignDto } from './dto/create-campaign.dto';
import { UpdateCampaignDto } from './dto/update-campaign.dto';

@Controller('campaign')
export class CampaignController {
  constructor(private readonly campaignService: CampaignService) {}

  @Get()
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    tags: ['campaign'],
    operationId: 'getAllCampaign',
    summary: 'Get all campaigns',
    description: 'Get all campaigns',
  })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Successful',
  })
  findAll() {
    return this.campaignService.findAll();
  }

  @Get(':id')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    tags: ['campaign'],
    operationId: 'getCampaign',
    summary: 'Get campaign',
    description: 'Get campaign',
  })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Successful',
  })
  findOne(@Param('id') id: number) {
    return this.campaignService.findOne(id);
  }

  @Post()
  @HttpCode(HttpStatus.CREATED)
  @ApiOperation({
    tags: ['campaign'],
    operationId: 'createCampaign',
    summary: 'Create campaign',
    description: 'Create campaign',
  })
  @ApiResponse({
    status: HttpStatus.CREATED,
    description: 'Successful',
    type: CreatedCampaignResponse,
  })
  createOne(
    @Body() createCampaignDto: CreateCampaignDto,
  ): Promise<CreatedCampaignResponse> {
    return this.campaignService.createOne(createCampaignDto);
  }

  @Patch(':id')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    tags: ['campaign'],
    operationId: 'updateCampaign',
    summary: 'Update campaign',
    description: 'Update campaign',
  })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Successful',
    type: UpdateCampaignDto,
  })
  updateOne(
    @Param('id') id: number,
    @Body() updateCampaignDto: UpdateCampaignDto,
  ): Promise<UpdateCampaignDto> {
    return this.campaignService.updateOne(id, updateCampaignDto);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    tags: ['campaign'],
    operationId: 'deleteCampaign',
    summary: 'Delete campaign',
    description: 'Delete campaign',
  })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Successful',
  })
  deleteOne(@Param('id') id: number) {
    return this.campaignService.deleteOne(id);
  }
}
