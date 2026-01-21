import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  final TextEditingController makananPokok = TextEditingController();
  final TextEditingController buah = TextEditingController();
  final TextEditingController lauk = TextEditingController();
  final TextEditingController sayur = TextEditingController();
  final db = FirebaseDatabase.instance.ref();
  String get tanggal {
    final now = DateTime.now();
    return "${now.year.toString().padLeft(4, '0')}-"
        "${now.month.toString().padLeft(2, '0')}-"
        "${now.day.toString().padLeft(2, '0')}";
  }

  
}