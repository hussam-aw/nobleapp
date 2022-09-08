import 'package:get/get.dart';
import 'package:noble/Constants/routes.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    int _delaySecond = 2;
    if (Get.currentRoute == AppRoutes.splashScreen) {
      Future.delayed(Duration(seconds: _delaySecond)).then((value) {
        Get.offNamed(AppRoutes.loginPage);
      });
    }
    super.onInit();
  }
}
