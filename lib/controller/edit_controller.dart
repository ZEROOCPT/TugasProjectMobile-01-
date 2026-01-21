import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditController extends GetxController {
  final TextEditingController tanggal = TextEditingController();
  final TextEditingController makananPokok = TextEditingController();
  final TextEditingController lauk = TextEditingController();
  final TextEditingController sayur = TextEditingController();
  final TextEditingController buah = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    final data = Get.arguments;

    tanggal.text = data['tanggal'];
    makananPokok.text = data['pokok'];
    lauk.text = data['lauk'];
    sayur.text = data['sayur'];
    buah.text = data['buah'];
  }

  Future<void> pilihTanggal(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      tanggal.text = DateFormat('dd MMMM yyyy', 'id_ID').format(picked);
    }
  }

  @override
  void onClose() {
    tanggal.dispose();
    makananPokok.dispose();
    lauk.dispose();
    sayur.dispose();
    buah.dispose();
    super.onClose();
  }
}
