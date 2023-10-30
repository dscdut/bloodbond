import { Injectable } from '@nestjs/common';
import { I18nService } from 'nestjs-i18n';

@Injectable()
export class NotificationTemplateService {
  constructor(private readonly i18n: I18nService) {}

  sendBloodDonationRequestNotification(): string {
    return this.i18n.translate('events.BLOOD_DONATION_IN_NEED', {
      lang: 'en',
    });
  }

  sendBloodDonationAcceptanceNotification(): string {
    return this.i18n.translate('events.BLOOD_DONATION_ACCEPTED', {
      lang: 'en',
    });
  }

  sendBloodDonationSearchingEndNotification(): string {
    return this.i18n.translate('events.BLOOD_DONATION_SEARCHING_END', {
      lang: 'en',
    });
  }

  sendCampaignCreatedNotification(campaignName: string): string {
    return this.i18n.translate('events.CAMPAIGN_CREATED', {
      lang: 'en',
      args: { campaignName },
    });
  }

  sendCampaignUpdatedNotification(campaignName: string): string {
    return this.i18n.translate('events.CAMPAIGN_UPDATED', {
      lang: 'en',
      args: { campaignName },
    });
  }
}
