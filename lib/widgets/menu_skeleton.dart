import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state.dart';

import '../screens/essentials/dashboard_screen.dart';
import '../screens/essentials/budgets_screen.dart';
import '../screens/essentials/transactions_screen.dart';
import '../screens/essentials/savings_screen.dart';
import '../screens/essentials/settings_screen.dart';

import 'bottom_navigation.dart';

class MenuSkeleton extends StatefulWidget {
  const MenuSkeleton({super.key});

  @override
  State<MenuSkeleton> createState() => _MenuSkeletonState();
}

class _MenuSkeletonState extends State<MenuSkeleton> {
  final List<String> menuItems = [
    'Dashboard',
    'Budgets',
    'Transactions',
    'Savings',
    'Settings',
  ];

  final List<Widget> screens = const [
    DashboardScreen(),
    BudgetsScreen(),
    TransactionsScreen(),
    SavingsScreen(),
    SettingsScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // App Name
            const Text(
              'BuhJeet',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // Month and Year
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  appState.getMonthAndYear,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Current Screen Title
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  menuItems[selectedIndex],
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Main Screen
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: screens[selectedIndex],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigation(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
