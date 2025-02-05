// Models/habitModel.dart
// class Habit {
//   final String id; // Unique identifier for the habit
//   final String title;
//   final String description;
//   final DateTime date;

//   Habit({
//     required this.id, // Include id in the constructor
//     required this.title,
//     required this.description,
//     required this.date,
//   });

//   factory Habit.fromJson(Map<String, dynamic> json) {
//     return Habit(
//       id: json['id'] ?? '', // Parse id from JSON
//       title: json['title'] ?? '', // Default to empty string if null
//       description: json['description'] ?? '', // Default to empty string if null
//       date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()), // Default to now if null
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id, // Include id in the JSON output
//       'title': title,
//       'description': description,
//       'date': date.toIso8601String(), // Convert date to string for JSON
//     };
//   }
// }


// class Habit {
//   final String id;
//   final String title;
//   final String description;
//   final DateTime date; // Ensure it's DateTime

//   Habit({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.date,
//   });

//   factory Habit.fromJson(Map<String, dynamic> json) {
//     return Habit(
//       id: json['_id'] ?? '', 
//       title: json['title'] ?? '',
//       description: json['description'] ?? '',
//       date: DateTime.parse(json['date']), // Ensure it's DateTime
//     );
//   }
// }


class Habit {
  final String id;
  final String title;
  final String description;
  final DateTime date;

  Habit({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['_id'] ?? '', // Handle null case
      title: json['title'] ?? '', // Handle null case
      description: json['description'] ?? '', // Handle null case
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()), // Handle null case
    );
  }
}