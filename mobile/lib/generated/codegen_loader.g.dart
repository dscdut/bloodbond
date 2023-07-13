// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "texts": {
    "notification": "Notification",
    "success": "Success",
    "error_occur": "An error has occurred, please try again later",
    "email_address": "Email Address",
    "email": "Email",
    "password": "Password",
    "login_prompt": "Login to continue using the app",
    "or_login_with": "Or login with",
    "email_verification_prompt": "Enter your email for the verification process, we will send a 4-digit code to your email."
  },
  "button": {
    "cancel": "Cancel",
    "confirm": "Confirm",
    "send": "Send"
  },
  "root": {
    "home": "Home",
    "profile": "Profile",
    "management": "Management"
  },
  "auth": {
    "welcome_back": "Nice to have you back!",
    "login": "Login",
    "register": "Register",
    "forgot_password": "Forgot password?",
    "dont_have_an_account": "Don't have an account?"
  },
  "validator": {
    "email_required": "Enter your email",
    "password_required": "Enter your password",
    "invalid_email": "Invalid email address",
    "incorrect_email_password": "Incorrect email or password",
    "invalid_password": "Password must be at least 8 characters",
    "field_required": "This field is required",
    "not_match_password": "Password and confirm password not match"
  }
};
static const Map<String,dynamic> vi = {
  "texts": {
    "notification": "Thông báo",
    "success": "Thành công",
    "error_occur": "Đã có lỗi xảy ra, vui lòng thử lại sau",
    "email_address": "Email Address",
    "email": "Email",
    "password": "Mật khẩu",
    "login_prompt": "Đăng nhập để tiếp tục sử dụng ứng dụng",
    "or_login_with": "Hoặc đăng nhập bằng",
    "email_verification_prompt": "Nhập email của bạn để tiến hành xác thực, chúng tôi sẽ gửi mã xác thực 4 chữ số đến email của bạn"
  },
  "button": {
    "cancel": "Hủy",
    "confirm": "Xác nhận",
    "send": "Gửi"
  },
  "root": {
    "home": "Trang chủ",
    "profile": "Cá nhân",
    "management": "Quản lý"
  },
  "auth": {
    "welcome_back": "Rất vui khi được gặp lại bạn!",
    "login": "Đăng nhập",
    "register": "Đăng ký",
    "forgot_password": "Quên mật khẩu?",
    "dont_have_an_account": "Chưa có tài khoản?"
  },
  "validator": {
    "email_required": "Vui lòng nhập email",
    "password_required": "Vui lòng nhập mật khẩu",
    "invalid_email": "Không đúng định dạng email",
    "incorrect_email_password": "Email hoặc mật khẩu không đúng",
    "invalid_password": "Mật khẩu phải có ít nhất 8 kí tự",
    "field_required": "Không được để trống",
    "not_match_password": "Mật khẩu xác nhận không trùng khớp"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "vi": vi};
}
