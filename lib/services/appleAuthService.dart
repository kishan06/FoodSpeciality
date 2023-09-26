import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class appleAuthService extends FirebaseAuthPlatform {
  Future<UserCredentialPlatform?> signInWithApple() async {
    // final appleProvider = AppleAuthProvider();
    // var data =
    //     await FirebaseAuthPlatform.instance.signInWithProvider(appleProvider);
    // print("apple sign in creds ${data.additionalUserInfo?.profile}");
    // return data;

    try {
      // Perform the Apple Sign-In
      final result = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      print("email is ${result.email}");
      print("username is ${result.givenName}");

      print("auth code is ${result.authorizationCode}");
      print("user identify${result.userIdentifier}");

      // Create a Firebase credential from the Apple ID credential
      final authCredential = OAuthProvider("apple.com").credential(
        idToken: result.identityToken,
        accessToken: result.authorizationCode,
      );

      // Sign in with Firebase
      final authResult = await FirebaseAuthPlatform.instance
          .signInWithCredential(authCredential);

      return authResult;
    } catch (error) {
      print("Apple Sign-In Error: $error");
      return null;
    }
  }
}
