import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasky_do/components/custom_snackbar.dart';
import 'package:tasky_do/screen/home_screen.dart';

class SignUpController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void signUp() async {
    if (!Get.isSnackbarOpen) {
      if (nameController.text.trim().isEmpty) {
        CustomSnackBar.displaySnackBar("Please enter a name");
      } else if (emailController.text.trim().isEmpty) {
        CustomSnackBar.displaySnackBar("Please enter an email");
      } else if (passwordController.text.trim().isEmpty) {
        CustomSnackBar.displaySnackBar("Please enter a password");
      } else if (confirmPasswordController.text.trim().isEmpty) {
        CustomSnackBar.displaySnackBar("Please enter a confirm password");
      } else if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
        CustomSnackBar.displaySnackBar("Password and confirm password is not same");
      } else {
        try {
          UserCredential userCredential = await auth
              .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
              .then((value) async {
            await value.user?.updateDisplayName(nameController.text);
            return value;
          });
          // print("-------------${userCredential.user?.email}");
          // print("-------------${userCredential.user?.displayName}");
          // print("-------------${userCredential.user?.uid}");
        } catch (_) {}
      }
    }

    // AuthCredential credential = AuthCredential(providerId: providerId, signInMethod: signInMethod,)
  }

  Future<void> signUpWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      UserCredential credential = await auth.signInWithCredential(authCredential);
      User? user = credential.user;
      if (user != null) {
        /// user signed in successfully with google
        Get.to(() => const HomeScreen());
      }
    }
  }

// void signUPWithFacebook() async {
//   LoginResult loginResult = await FacebookAuth.instance.login(permissions: ["email"]);
//   print("${loginResult.status}");
//   print("${loginResult.message}");
//   print("${loginResult.accessToken?.token}");
// }
}
