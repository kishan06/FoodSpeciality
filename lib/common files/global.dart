String? accessToken;
// String uri = 'http://<yourip>:3000';

class ApiUrls {
  static const _base = "http://77.68.102.23:8000/";
  static const login = _base + "auth/login";
  static const signUp = _base + "auth/register";
  static const addRecipe = _base + "recipe/create";
  static const forgotPassword = _base + "auth/forgot-password";
  static const verifyOtp = _base + "auth/verify-otp";
  
}
