export type UserDevice = {
  userId: string;
  deviceToken: string;
  settings: {
    notification: {
      push: boolean;
      email: boolean;
    };
  };
};
