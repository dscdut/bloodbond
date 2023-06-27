import { Test, TestingModule } from '@nestjs/testing';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { RegisterResponse } from './response/register.response';

describe('AuthController', () => {
  let authController: AuthController;
  let authService: AuthService;

  const result: RegisterResponse = {
    email: 'example@gmail.com',
    id: 1,
  };

  beforeEach(async () => {
    const authServiceProvider = {
      provide: AuthService,
      useFactory: () => ({
        registerUser: jest.fn(() => result),
      }),
    };

    const module: TestingModule = await Test.createTestingModule({
      controllers: [AuthController],
      providers: [AuthService, authServiceProvider],
    }).compile();

    authController = await module.resolve<AuthController>(AuthController);
    authService = await module.resolve<AuthService>(AuthService);
  });

  describe('register', () => {
    it('should call registerUser for a user', async () => {
      authController.register({
        email: 'example@gmail.com',
        password: 'password',
      });
      expect(authService.registerUser).toHaveBeenCalled();
    });

    it('should return a user', async () => {
      const result: RegisterResponse = {
        email: 'example@gmail.com',
        id: 1,
      };

      expect(
        authService.registerUser({
          email: 'example@gmail.com',
          password: 'password',
        }),
      ).toBe(result);
    });
  });
});
