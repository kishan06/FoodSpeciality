String? accessToken;
String? myUserId;
String? myImage;
String? playerIdGlobal;
var recipeIdFromDeepLink;


bool? onboard;
// String uri = 'http://<yourip>:3000';

class ApiUrls {
  static const _base = "http://77.68.102.23:8000/";
  // static const _base = "http://192.168.1.13:8000/";

  static const base = "http://77.68.102.23:8000/";
  // static const base = "http://192.168.1.13:8000/";

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
  static const addComments = _base + "recipe/add-comment";
  static const likeComment = _base + "recipe/comment/like";

  static const commentReplies = _base + "recipe/get-replies";
  static const savedRecipes = _base + "user/recipes/saved";
  static const recipeDetails = _base + "recipe/getdetails";
  static const userRecipes = _base + "recipe/getPublished";

  static const privatechatlist = _base + "user/chat-rooms";
  static const communitychatlist = _base + "user/community/all";
  static const privatechatdetails = _base + "user/chats";
  static const communitychatdetails = _base + "community/chats";
  static const report = _base + "report/create";

  static const exitcommunity = _base + "user/community/exit";
  static const deletecommunity = _base + "user/community/delete";
  static const updatecommunity = _base + "community/update";
  static const addparticipants = _base + "community/members/add";

  static const addReply = _base + "recipe/add-reply";
  static const getExplore = _base + "recipe/explore";
  static const getonGoingChallenge = _base + "admin/challanges/ongoing";
  static const getTrendingRecipe = _base + "recipe/trending";
  static const getChallengeData = _base + "user/challenges";
  static const getSimilarRecipe = _base + "recipe/similar";

  static const viewuser = _base + "inspiration/user-profile";

  static const removeFollower = _base + "user/remove-follower";
  static const getJoinedChallenge = _base + "user/challenge/joined";
  static const getCompletedChallenge = _base + "user/challenge/completed";
  static const getMyChallenge = _base + "user/challenge/mychallenges";
  static const editProfile = _base + "user/profile/update";
  static const getBlogsData = _base + "blog/all";
  static const getDefaultSearchData = _base + "recipe-category/quick-search";
  static const getSearchRecipe = _base + "recipe/search?search=";
  static const getDefaultCommunitySearch = _base + "community/getcommunity";
  static const getCommunitySearch = _base + "community/searchCommunity?search=";
  static const getNotification = _base + "user/notification";
  static const storeGoogleSigninDetails = _base + "auth/register-auth";
  static const loginWithGoogleSignin = _base + "auth/login-auth";

  // static const commentReplies = _base + "recipe/get-replies";
}
