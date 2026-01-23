import 'package:get/route_manager.dart';
import 'package:tugasandroidkel1/bindings/add_binding.dart';
import 'package:tugasandroidkel1/bindings/dashboard_binding.dart';
import 'package:tugasandroidkel1/bindings/edit_binding.dart';
import 'package:tugasandroidkel1/pages/add_page.dart';
import 'package:tugasandroidkel1/pages/dashboard_page.dart';
import 'package:tugasandroidkel1/pages/edit_page.dart';
import 'package:tugasandroidkel1/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.dashboardPage, page: () => DashboardPage(), bindings: [AddBinding(), DashboardBinding()]),
    GetPage(name: AppRoutes.addPage, page: () => AddPage(), binding: AddBinding()),
    GetPage(name: AppRoutes.editPage, page: () => EditPage(), binding: EditBinding()),
  ];
}