// GetX/HabitController.dart
// import 'package:get/get.dart';
// import 'package:habbit_app/Models/habitModel.dart';
// import 'package:habbit_app/Screens/habits/services/habit_Services.dart';

// class HabitController extends GetxController {
//   var isLoading = false.obs;
//   var habitsList = <Habit>[].obs;
//   final HabitServices _habitServices = HabitServices();

//   @override
//   void onInit() {
//     super.onInit();
//     getAllHabits();
//   }

//   void addHabit(String title, String description) async {
//     isLoading.value = true;
//     try {
//       Habit? newHabit = await _habitServices.addHabit(title, description);
//       if (newHabit != null) {
//         habitsList.add(newHabit); // Add to the local list
//         Get.back(result: newHabit); // Navigate back with the new habit
//       } else {
//         Get.snackbar('Error', 'Failed to create habit');
//       }
//     } catch (error) {
//       Get.snackbar('Error', error.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void getAllHabits() async {
//     try {
//       List<Habit> fetchedHabits = await _habitServices.getAllHabits();
//       habitsList.value = fetchedHabits; // Update list
//     } catch (error) {
//       Get.snackbar('Error', 'Failed to fetch habits');
//     }
//   }

//   void deleteHabit(String id) async {
//     try {
//       await _habitServices.deleteHabit(id);
//       habitsList.removeWhere((habit) => habit.id == id); // Remove from list
//     } catch (error) {
//       Get.snackbar('Error', error.toString());
//     }
//   }
// }
// import 'package:get/get.dart';
// import 'package:habbit_app/Models/habitModel.dart';
// import 'package:habbit_app/Screens/habits/services/habit_Services.dart';

// class HabitController extends GetxController {
//   var isLoading = false.obs;
//   var habitsList = <Habit>[].obs;
//   final HabitServices _habitServices = HabitServices();

//   @override
//   void onInit() {
//     super.onInit();
//     getAllHabits();
//   }

//   void addHabit(String title, String description) async {
//     if (title.trim().isEmpty || description.trim().isEmpty) {
//       Get.snackbar("Error", "Title and description cannot be empty");
//       return;
//     }

//     isLoading.value = true;
//     try {
//       Habit? newHabit = await _habitServices.addHabit(title, description);

//       if (newHabit != null && newHabit.id != null) {
//         habitsList.add(newHabit); // Add to the local list
//         Get.back(result: newHabit); // Navigate back with the new habit
//       } else {
//         Get.snackbar('Error', 'Failed to create habit: No valid data returned');
//       }
//     } catch (error) {
//       Get.snackbar('Error', error.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void getAllHabits() async {
//     try {
//       List<Habit> fetchedHabits = await _habitServices.getAllHabits();
//       if (fetchedHabits.isNotEmpty) {
//         habitsList.assignAll(fetchedHabits); // Update list
//       } else {
//         Get.snackbar("Info", "No habits found");
//       }
//     } catch (error) {
//       Get.snackbar('Error', 'Failed to fetch habits');
//     }
//   }

//   void deleteHabit(String id) async {
//     try {
//       bool isDeleted = await _habitServices.deleteHabit(id);
//       if (isDeleted) {
//         habitsList.removeWhere((habit) => habit.id == id); // Remove from list
//       } else {
//         Get.snackbar('Error', 'Failed to delete habit');
//       }
//     } catch (error) {
//       Get.snackbar('Error', error.toString());
//     }
//   }
// }


import 'package:get/get.dart';
import 'package:habbit_app/Models/habitModel.dart';
import 'package:habbit_app/Screens/habits/services/habit_Services.dart';

class HabitController extends GetxController {
  var isLoading = false.obs;
  var habitsList = <Habit>[].obs;
  final HabitServices _habitServices = HabitServices();

  @override
  void onInit() {
    super.onInit();
    fetchHabits();
  }

  // Fetch all habits
  Future<void> fetchHabits() async {
    try {
      isLoading.value = true;
      final habits = await _habitServices.getAllHabits();
      habitsList.assignAll(habits);
    } catch (error) {
      Get.snackbar('Error', 'Failed to fetch habits: $error');
    } finally {
      isLoading.value = false;
    }
  }

  // Add a new habit
  Future<void> addHabit(String title, String description) async {
    if (title.trim().isEmpty || description.trim().isEmpty) {
      Get.snackbar('Error', 'Title and description cannot be empty');
      return;
    }

    try {
      isLoading.value = true;
      final newHabit = await _habitServices.addHabit(title, description);
      habitsList.add(newHabit);
      Get.back(); // Navigate back after adding
    } catch (error) {
      Get.snackbar('Error', 'Failed to add habit: $error');
    } finally {
      isLoading.value = false;
    }
  }

  // Delete a habit
  Future<void> deleteHabit(String id) async {
    try {
      final isDeleted = await _habitServices.deleteHabit(id);
      if (isDeleted) {
        habitsList.removeWhere((habit) => habit.id == id);
      }
    } catch (error) {
      Get.snackbar('Error', 'Failed to delete habit: $error');
    }
  }
}