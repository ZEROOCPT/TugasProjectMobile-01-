import 'package:get/get.dart';
import 'package:tugasandroidkel1/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MealController>(() => MealController());
  }
}