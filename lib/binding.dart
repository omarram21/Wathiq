import 'package:get/get.dart';
import 'package:wathiq/controllers/tows-truck-controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TowsTruckController());
    // Get.put<Service>(() => Api());
  }
}
