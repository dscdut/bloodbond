import { Global, Module, Provider } from '@nestjs/common';
import { ApiConfigService } from './api-config.service';

const providers: Provider[] = [ApiConfigService];

@Global()
@Module({
  providers,
  imports: [],
  exports: providers,
})
export class SharedModule {}
