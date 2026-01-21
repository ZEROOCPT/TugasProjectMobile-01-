import 'package:get/get.dart';
import 'package:tugasandroidkel1/controller/model/mealentry.dart';

class MealController extends GetxController {
  var meals = <MealEntry>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadMeals();
  }

  void loadMeals() {
    isLoading.value = true;
    // Simulate API call
    Future.delayed(const Duration(milliseconds: 500), () {
      meals.value = [
        MealEntry(
          id: '1',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
        MealEntry(
          id: '2',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
        MealEntry(
          id: '3',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
        MealEntry(
          id: '4',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
        MealEntry(
          id: '4',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
        MealEntry(
          id: '4',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
        MealEntry(
          id: '4',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
        MealEntry(
          id: '4',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
        MealEntry(
          id: '4',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
        MealEntry(
          id: '4',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
        MealEntry(
          id: '4',
          date: '21 Januari 2026',
          pokok: 'Nasi',
          sayur: 'Sawi',
          lauk: 'Katsu',
          buah: 'Apel',
        ),
      ];
      isLoading.value = false;
    });
  }

  void refreshMeals() {
    loadMeals();
  }
}
