import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zekatcalculate/widgets/mybottomnavbar.dart';

class DashboardScreen extends StatefulWidget {
  final Widget child;
  final GoRouterState state;
  const DashboardScreen({super.key, required this.child, required this.state});


  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child
        ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}