import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isLoading = true;
  bool isLoggedIn = false;

  DateTime now = DateTime.now();

  // GETTER METHODS
  String get getMonthAndYear => '${_monthName(now.month)} ${now.year}';

  double get currentMonthBalance => 1200.00;

  double get currentMonthBudget => 5000.00;

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return months[month - 1];
  }
}
