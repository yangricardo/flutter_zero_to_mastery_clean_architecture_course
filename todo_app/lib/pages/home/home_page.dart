import 'package:flutter/material.dart';
import 'package:todo_app/pages/dashboard/dashboard_page.dart';
import 'package:todo_app/pages/overview/overview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const tabs = [DashboardPage.pageConfig, OverviewPage.pageConfig];

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
