import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Rxn<GoogleSignInAccount> googleAccount = Rxn<GoogleSignInAccount>();

  Future<void> loginWithGoogle() async {
    try {
      googleAccount.value = await googleSignIn.signIn();
      if (googleAccount.value != null) {
        print("Signed in: ${googleAccount.value!.displayName}");
      } else {
        print("Google sign-in canceled.");
      }
    } catch (error) {
      print('Error signing in: $error');
    }
  }

  Future<void> logout() async {
    await googleSignIn.signOut();
    googleAccount.value = null;
  }
}
