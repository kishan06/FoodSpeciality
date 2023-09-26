import 'package:foodspeciality/ViewModel/GoogleSigninApi.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

String? userName;
String? mobileNumber;
String? emailAddress;
String? idTokenGoogleSignin;

class googleAuthService extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((User? newUser) {
      user.value = newUser;
    });
  }

  Future<void> handleGoogleSignIn() async {
    // await FirebaseAuth.instance.signOut();

    // Map<String, dynamic> updata = {
    //   "username": "kishan1",
    //   "email": "kishan1@gmail.com",
    //   "phone": "123456564",
    //   "ID": "efsfsfsefsef"
    // };
    //     GoogleSigninApi().googleSigninApi(updata);

    try {
      // This will show the Google Sign-In popup and allow the user to select an account.
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//       if (googleUser == null) {
//         // The user canceled the sign-in process.
//         return;
//       }

//       // If the user signed in successfully, we can get their user information.
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final String? accessToken = googleAuth.accessToken;
      final String? idToken = googleAuth.idToken;

      // print("success id is ${googleUser.displayName}");
      // print("success id is ${googleUser.email}");
      // print("id token is ${googleAuth.idToken}");

      // You can now use the `accessToken` and `idToken` for further authentication with your backend or Firebase.
      // For example, you can send these tokens to your server to authenticate the user.

      // Do something with the user information (e.g., navigate to a new screen).
      // Replace the lines below with your desired actions.
      // Navigator.of(context).pushReplacementNamed('/home');

      //new method

      // Sign in with Google credentials using Firebase Authentication.
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      // Use Firebase Authentication to sign in with the provided credential.
      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Firebase user information is available in authResult.user.
      final User? firebaseUser = authResult.user;

      print("Firebase user ID: ${firebaseUser?.uid}");
      print("Firebase user email: ${firebaseUser?.email}");
      print("Firebase user display name: ${firebaseUser?.displayName}");
      print("Firebase user metadata: ${firebaseUser?.metadata}");
      print("Firebase user number: ${firebaseUser?.phoneNumber}");
      userName = firebaseUser?.displayName;
      mobileNumber = firebaseUser?.phoneNumber;
      emailAddress = firebaseUser?.email;
      idTokenGoogleSignin = firebaseUser?.uid;
    } catch (error) {
      // Handle any errors that occurred during the sign-in process.
      print('Error during Google Sign-In: $error');
    }
  }
}
