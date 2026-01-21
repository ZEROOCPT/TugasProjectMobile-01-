import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasandroidkel1/components/custom_field.dart';
import 'package:tugasandroidkel1/controller/add_controller.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddController>();

    return Scaffold(
      appBar: AppBar(title: Text('Add Menu')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            CustomField(
              controller: controller.makananPokok,
              text: 'Makanan Pokok',
              icon: Icons.rice_bowl_outlined,
            ),
            CustomField(
              controller: controller.lauk,
              text: 'Lauk',
              icon: Icons.restaurant,
            ),
            CustomField(
              controller: controller.buah,
              text: 'Buah',
              icon: Icons.apple,
            ),
            CustomField(
              controller: controller.sayur,
              text: 'Sayur',
              icon: Icons.eco,
            ),
          ],
        ),
      ),
    );
  }
}
