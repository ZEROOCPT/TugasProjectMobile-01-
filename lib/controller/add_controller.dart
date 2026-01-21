import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class AddController extends GetxController {
  final TextEditingController makananPokok = TextEditingController();
  final TextEditingController buah = TextEditingController();
  final TextEditingController lauk = TextEditingController();
  final TextEditingController sayur = TextEditingController();
  final TextEditingController tanggal = TextEditingController();

  final DatabaseReference db = FirebaseDatabase.instance.ref();

  @override
  void onInit() {
    super.onInit();

    initializeDateFormatting('id_ID', null).then((_) {
      tanggal.text =
          DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now());
    });
  }


  Future<void> saveMenu() async {
    if (makananPokok.text.isEmpty ||
        lauk.text.isEmpty ||
        sayur.text.isEmpty ||
        buah.text.isEmpty ||
        tanggal.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua field harus diisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final newRef = db.child('menus').push();

    await newRef.set({
      'tanggal': tanggal.text,
      'pokok': makananPokok.text,
      'lauk': lauk.text,
      'sayur': sayur.text,
      'buah': buah.text,
    });

    Get.back();
  }

  @override
  void onClose() {
    makananPokok.dispose();
    buah.dispose();
    lauk.dispose();
    sayur.dispose();
    tanggal.dispose();
    super.onClose();
  }
}
