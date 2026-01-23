import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tugasandroidkel1/model/mealentry.dart';

class MealController extends GetxController {
  var meals = <MealEntry>[].obs;
  var isLoading = false.obs;

  final DatabaseReference db = FirebaseDatabase.instance.ref().child('menus');

  @override
  void onInit() {
    super.onInit();

    initializeDateFormatting('id_ID', null).then((_) {
      loadMeals();
    });
  }

  void loadMeals() {
    isLoading.value = true;
    // Simulate API call
    db.onValue.listen((event) {
      final data = event.snapshot.value;

      if (data == null) {
        meals.clear();
        isLoading.value = false;
        return;
      }

      final Map<dynamic, dynamic> map = data as Map<dynamic, dynamic>;
      final List<MealEntry> meal = [];

      map.forEach((key, value) {
        meal.add(
          MealEntry(
            id: key,
            date: value['tanggal'] ?? '',
            pokok: value['pokok'] ?? '',
            lauk: value['lauk'] ?? '',
            sayur: value['sayur'] ?? '',
            buah: value['buah'] ?? '',
          ),
        );
      });

      final formatter = DateFormat('dd MMMM yyyy', 'id_ID');

      meal.sort((a, b) {
        final dateA = formatter.parse(a.date);
        final dateB = formatter.parse(b.date);
        return dateA.compareTo(dateB); // kecil ➝ besar
      });

      meals.value = meal;
      isLoading.value = false;
    });
  }
}
