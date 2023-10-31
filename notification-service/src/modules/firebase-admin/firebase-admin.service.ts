import { Injectable } from '@nestjs/common';
import * as admin from 'firebase-admin';
import * as serviceAccount from './service-account.json';

@Injectable()
export class FirebaseAdminService {
  private readonly app: admin.app.App;

  constructor() {
    if (!admin.apps.length) {
      this.app = admin.initializeApp({
        credential: admin.credential.cert(
          serviceAccount as admin.ServiceAccount,
        ),
        projectId: serviceAccount.project_id,
      });
    } else {
      this.app = admin.app();
    }
  }

  getFirebaseAdmin(): admin.app.App {
    return this.app;
  }
}
