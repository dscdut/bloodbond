export type PushNotificationType = {
  notification: {
    title: string;
    body: string;
  };
  tokens: string[];
};
