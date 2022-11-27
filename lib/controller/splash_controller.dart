import 'package:get/get.dart';
import 'package:tasky_do/screen/on_boarding.dart';

class SplashController extends GetxController {


  void goToOnBoarding(){
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const OnBoardingScreen());
    });
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    goToOnBoarding();
  }
}
