String? accessToken;
// String uri = 'http://<yourip>:3000';

class ApiUrls {
  static const _base = "http://77.68.102.23:8000/";
  static const login = "${_base}auth/login";
  static const signUp = "${_base}auth/register";
  static const addRecipe = "${_base}recipe/create";

  static const forgotPassword = "${_base}auth/forgot-password";
  static const verifyOtp = "${_base}auth/verify-otp";

  static const createCommunity = "${_base}community/create";
  static const getfollowerFollowing = "${_base}user/followes";
  static const faq = "${_base}admin/faq/getAll";

  static const policy = "${_base}admin/policy/getAll";

  static const storeGoogleSigninDetails = "${_base}auth/register-auth";
}
