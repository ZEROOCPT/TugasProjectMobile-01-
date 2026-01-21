import 'package:get/route_manager.dart';
import 'package:tugasandroidkel1/bindings/add_binding.dart';
import 'package:tugasandroidkel1/pages/add_page.dart';
import 'package:tugasandroidkel1/pages/dashboard_page.dart';
import 'package:tugasandroidkel1/pages/edit_page.dart';
import 'package:tugasandroidkel1/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.dashboardPage, page: () => DashboardPage(), binding: AddBinding()),
    GetPage(name: AppRoutes.addPage, page: () => AddPage()),
    GetPage(name: AppRoutes.editPage, page: () => EditPage()),
  ];
}