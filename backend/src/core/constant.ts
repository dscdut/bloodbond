import { config } from 'dotenv';

config();

export const ROOT_DIR =
  process.env.NODE_ENV === 'production'
    ? `${process.cwd()}/dist`
    : `${process.cwd()}/src`;
