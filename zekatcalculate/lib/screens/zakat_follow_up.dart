// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../core/localizations.dart';
import '../widgets/zakat_entry_form.dart'; // Eklediğimiz yeni widget'ı içeri aktarıyoruz

import '../widgets/myappbar.dart';
import '../widgets/mybottomnavbar.dart';

class ZakatScreen extends StatefulWidget {
  const ZakatScreen({Key? key}) : super(key: key);

  @override
  _ZakatScreenState createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: MyAppBar(title: AppLocalizations.of(context)
                          .getTranslate("zakat_follows")),
        body: ZakatEntryForm(), // Yeni eklediğimiz form widget'ını kullanıyoruz
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
