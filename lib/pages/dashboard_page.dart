import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasandroidkel1/components/cardreusable.dart';
import 'package:tugasandroidkel1/controller/dashboard_controller.dart';
import 'package:tugasandroidkel1/routes/routes.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final MealController controller = Get.put(MealController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.meals.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restaurant_menu,
                            size: 80, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'Belum ada menu',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.meals.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final meal = controller.meals[index];

                    return MealLogCard(
                      date: meal.date,
                      pokok: meal.pokok,
                      sayur: meal.sayur,
                      lauk: meal.lauk,
                      buah: meal.buah,
                      onEdit: () {
                        Get.toNamed(
                          AppRoutes.editPage,
                          arguments: {
                            'id': meal.id,
                            'tanggal': meal.date,
                            'pokok': meal.pokok,
                            'lauk': meal.lauk,
                            'sayur': meal.sayur,
                            'buah': meal.buah,
                          },
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addPage);
        },
        backgroundColor: Colors.white,
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.black, size: 32),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Text(
            'MENU MBG',
            style: TextStyle(
              color: Color(0xFF1E3A5F),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              'assets/images/b.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
