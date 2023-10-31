import { Injectable } from '@nestjs/common';
import { I18nService } from 'nestjs-i18n';
import { PushNotificationType } from './types/push-notification.type';

@Injectable()
export class NotificationTemplateService {
  constructor(private readonly i18n: I18nService) {}

  sendBloodDonationRequestNotification(): PushNotificationType {
    return {
      title: 'Blood donation request',
      body: this.i18n.translate('events.BLOOD_DONATION_IN_NEED', {
        lang: 'en',
      }),
    };
  }

  sendBloodDonationAcceptanceNotification(): PushNotificationType {
    return {
      title: 'Blood donation accepted',
      body: this.i18n.translate('events.BLOOD_DONATION_ACCEPTED', {
        lang: 'en',
      }),
    };
  }

  sendBloodDonationSearchingEndNotification(): PushNotificationType {
    return {
      title: 'Blood donation searching ended',
      body: this.i18n.translate('events.BLOOD_DONATION_SEARCHING_END', {
        lang: 'en',
      }),
    };
  }

  sendCampaignCreatedNotification(campaignName: string): PushNotificationType {
    return {
      title: 'Campaign created',
      body: this.i18n.translate('events.CAMPAIGN_CREATED', {
        lang: 'en',
        args: { campaignName },
      }),
    };
  }

  sendCampaignUpdatedNotification(campaignName: string): PushNotificationType {
    return {
      title: 'Campaign updated',
      body: this.i18n.translate('events.CAMPAIGN_UPDATED', {
        lang: 'en',
        args: { campaignName },
      }),
    };
  }
}
