import axios from 'axios';

export class DiscordBot {
  constructor(
    private readonly webhook: string,
    private readonly username: string,
    private readonly avatarUrl: string,
  ) {}

  async logErrors(content: any) {
    try {
      const url = this.webhook;
      const data = {
        username: this.username,
        avatar_url: this.avatarUrl,
        content,
      };
      await axios.post(url, data);
    } catch (error) {
      console.error(error);
    }
  }
}
