import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/app_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _monthlyBalanceOverview(appState),
          SizedBox(height: 16),
          _weeklyTrend(),
          SizedBox(height: 16),
          _quickDetails(),
          SizedBox(height: 16),
          _recentTransactions(),
        ],
      ),
    );
  }

  Widget _monthlyBalanceOverview(AppState appState) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          Row(
            children: [
              Text(
                'Available to spend',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Php ${appState.currentMonthBalance.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Slider(
            value: appState.currentMonthBalance,
            min: 0,
            max: appState.currentMonthBudget,
            onChanged: (value) {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Php ${(appState.currentMonthBudget - appState.currentMonthBalance).toStringAsFixed(2)} spent',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'from Php ${appState.currentMonthBudget.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weeklyTrend() {
    return Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [

        ],
      ),
    );
  }

  Widget _quickDetails() {
    return Card(child: Row(children: [

        ],
      ));
  }

  Widget _recentTransactions() {
    return Card(child: Column(children: [Text("Recent Activites")]));
  }
}
