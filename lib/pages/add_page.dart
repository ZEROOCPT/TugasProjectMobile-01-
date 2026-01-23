import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tugasandroidkel1/components/buttonaddreusable.dart';
import 'package:tugasandroidkel1/components/custom_field.dart';
import 'package:tugasandroidkel1/controller/add_controller.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final controller = Get.find<AddController>();

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
          'TAMBAH MENU',
          style: TextStyle(
            color: Color(0xFF0A2A66),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              'assets/images/b.png',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );

                if (pickedDate != null) {
                  controller.tanggal.text =
                      DateFormat('dd MMMM yyyy', 'id_ID')
                          .format(pickedDate);
                }
              },
              child: AbsorbPointer(
                child: CustomField(
                  controller: controller.tanggal,
                  text: 'Tanggal',
                  icon: Icons.calendar_today,
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

            CustomButton(
              text: 'Simpan',
              onPressed: () {
              controller.saveMenu();
            },

            ),
          ],
        ),
      ),
    );
  }
}
