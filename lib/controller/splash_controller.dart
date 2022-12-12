import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:tasky_do/screen/home_screen.dart';
import 'package:tasky_do/screen/on_boarding.dart';
import 'package:tasky_do/utils/preference_utils.dart';

class SplashController extends GetxController {
  void goToOnBoarding() async {
    FirebaseApp app = await Firebase.initializeApp();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const OnBoardingScreen());
      // if (PreferenceUtils.getBoolValue("showOnBoarding")) {
      //   Get.off(() => const OnBoardingScreen());
      // } else {
      //   Get.off(() => const HomeScreen());
      // }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    goToOnBoarding();
  }
}
