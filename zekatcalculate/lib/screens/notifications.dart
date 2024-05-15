// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:zekatcalculate/widgets/myappbar.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: MyAppBar(title: "Bildirimler"),
      body: Center(
        child: Text(
          'Henüz hiçbir bildiriminiz yok.',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
