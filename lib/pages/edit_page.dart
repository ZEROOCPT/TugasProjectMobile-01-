import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasandroidkel1/components/buttonaddreusable.dart';
import 'package:tugasandroidkel1/components/custom_field.dart';
import 'package:tugasandroidkel1/controller/edit_controller.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key});

  final controller = Get.find<EditController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          'EDIT MENU',
          style: TextStyle(
            color: Color(0xFF0A2A66),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => controller.pilihTanggal(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF9EC3D8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.tanggal.text,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Icon(Icons.calendar_month),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            CustomField(
              controller: controller.makananPokok,
              text: 'Makanan Pokok',
              icon: Icons.rice_bowl_outlined,
            ),
            const SizedBox(height: 16),

            CustomField(
              controller: controller.lauk,
              text: 'Lauk',
              icon: Icons.restaurant,
            ),
            const SizedBox(height: 16),

            CustomField(
              controller: controller.sayur,
              text: 'Sayur',
              icon: Icons.eco,
            ),
            const SizedBox(height: 16),

            CustomField(
              controller: controller.buah,
              text: 'Buah',
              icon: Icons.apple,
            ),

            const SizedBox(height: 30),

            CustomButton(text: 'Update', onPressed: controller.updateMenu),

            const SizedBox(height: 30),

            CustomButton(text: 'Delete', onPressed: controller.deleteMenu, backgroundColor: Colors.red,),
          ],
        ),
      ),
    );
  }
}
