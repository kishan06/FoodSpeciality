String? accessToken;
bool? onboard;
// String uri = 'http://<yourip>:3000';

class ApiUrls {
  static const _base = "http://77.68.102.23:8000/";
  static const login = _base + "auth/login";
  static const signUp = _base + "auth/register";
  static const addRecipe = _base + "recipe/create";

  static const forgotPassword = _base + "auth/forgot-password";
  static const verifyOtp = _base + "auth/verify-otp";

  static const createCommunity = _base + "community/create";
  static const getfollowerFollowing = _base + "user/followes";
  static const faq = _base + "admin/faq/getAll";
  static const resendOtp = _base + "auth/resend-otp";
  static const setNewPassword = _base + "auth/set-password";

  static const policy = _base + "admin/policy/getAll";
  static const getrecipe = _base + "recipe/all";
  static const getcommunityguidelines = _base + "admin/community-guidlines/get";
  static const getabout = _base + "admin/about-us/get";
  static const like = _base + "user/recipe/like";
  static const save = _base + "user/recipe/save";
  static const follow = _base + "user/follow";
  static const getProfileData = _base + "user/profile";

  static const block = _base + "block";
  static const unblock = _base + "unblock";
  static const blocklist = _base + "block/blockList";

  static const getComments = _base + "recipe/get-comments";
  static const addComments  = _base + "recipe/add-comment";
  static const likeComment  = _base + "recipe/comment/like";
  

}
