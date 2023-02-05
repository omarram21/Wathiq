import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class TempController extends GetxController {
  RxString groub = "".obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print("===========================================");
    print(await InternetConnectionChecker().hasConnection);
  }
}
