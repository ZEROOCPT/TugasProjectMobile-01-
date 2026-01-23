import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditController extends GetxController {
  final TextEditingController tanggal = TextEditingController();
  final TextEditingController makananPokok = TextEditingController();
  final TextEditingController lauk = TextEditingController();
  final TextEditingController sayur = TextEditingController();
  final TextEditingController buah = TextEditingController();

  final DatabaseReference db = FirebaseDatabase.instance.ref();
  late String id;

  @override
  void onInit() {
    super.onInit();

    final data = Get.arguments;

    id = data['id'];

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

  Future<void> updateMenu() async {
    if (makananPokok.text.isEmpty ||
        lauk.text.isEmpty ||
        sayur.text.isEmpty ||
        buah.text.isEmpty ||
        tanggal.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua field harus diisi',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    await db.child('menus').child(id).update({
      'tanggal': tanggal.text,
      'pokok': makananPokok.text,
      'lauk': lauk.text,
      'sayur': sayur.text,
      'buah': buah.text,
    });

    Get.back(); // balik ke dashboard
  }

  Future<void> deleteMenu() async {
    Get.defaultDialog(
      title: "Hapus Menu?",
      middleText: "Yakin mau hapus menu ini?",
      textCancel: "Batal",
      textConfirm: "Hapus",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        await db.child('menus').child(id).remove();

        Get.back(); 
        Get.back(); 
      },
    );
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
