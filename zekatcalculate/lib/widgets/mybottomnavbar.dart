// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, library_private_types_in_public_api, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavBarItem(
              icon: Icons.home,
              label: 'Home',
              onTap: () {
                context.push('/Home');
              },
            ),
            _buildNavBarItem(
              icon: Icons.paid,
              label: 'Exchange',
              onTap: () {
                context.push('/exchange');
              },
            ),
            _buildNavBarItem(
              icon: Icons.bookmark,
              label: 'Zakat',
              onTap: () {
                context.push('/zakat');
              },
            ),
            _buildNavBarItem(
              icon: Icons.settings,
              label: 'Settings',
              onTap: () {
                context.push('/settings');
              },
            ),
            _buildNavBarItem(
              icon: Icons.person,
              label: 'Profile',
              onTap: () {
                context.push('/profile');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

