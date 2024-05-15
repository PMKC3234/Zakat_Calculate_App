// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields, library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:gap/gap.dart';
import 'package:zekatcalculate/screens/exchange.dart';
import 'package:zekatcalculate/screens/login.dart';
import 'package:zekatcalculate/screens/settings.dart';
import 'package:zekatcalculate/screens/zakat_follow_up.dart';
import 'package:zekatcalculate/widgets/mybottomnavbar.dart';
import '../core/localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _tlSavingsController = TextEditingController();
  TextEditingController _dollarSavingsController = TextEditingController();
  TextEditingController _euroSavingsController = TextEditingController();
  TextEditingController _goldController = TextEditingController();
  TextEditingController _silverController = TextEditingController();
  double _totalZakat = 0.0;

  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdvancedDrawer(
        controller: _advancedDrawerController,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).getTranslate("home_title")),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu,color: Theme.of(context).primaryColor,),
              onPressed: _advancedDrawerController.showDrawer,
            ),
          ),
          body: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        _tlSavingsController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _tlSavingsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText:AppLocalizations.of(context).getTranslate("textfield-1"),
                            prefixIcon: Icon(Icons.account_balance_wallet),
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        _dollarSavingsController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _dollarSavingsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText:AppLocalizations.of(context).getTranslate("textfield-2"),
                            prefixIcon: Icon(Icons.account_balance_wallet),
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        _euroSavingsController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _euroSavingsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText:AppLocalizations.of(context).getTranslate("textfield-3"),
                            prefixIcon: Icon(Icons.account_balance_wallet),
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        _goldController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _goldController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).getTranslate("textfield-4"),
                            prefixIcon: Icon(Icons.account_balance),
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        _silverController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _silverController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).getTranslate("textfield-5"),
                            prefixIcon: Icon(Icons.account_balance),
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  ElevatedButton(
                    onPressed: _calculateZakat,
                    child: Text(
                      AppLocalizations.of(context).getTranslate("zakat_calculate"),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
  "${AppLocalizations.of(context).getTranslate("total_give_zakat")} $_totalZakat TL",
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  textAlign: TextAlign.center,
),

                ],
              ),
            ),
          ),
          bottomNavigationBar: MyBottomNavBar(),
        ),
        drawer: Container(
          color: Theme.of(context).backgroundColor,
          width: MediaQuery.of(context).size.width * 0.65,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).drawerTheme.backgroundColor,
                ),
                currentAccountPicture: CircleAvatar(
                  child: Image.asset("assets/images/icons/icon.png"),
                ),
                accountName: Text('Talha Pamukcu',style: TextStyle(color: Colors.grey),),
                accountEmail: Text('talhapamukcu@hotmail.com',style: TextStyle(color: Colors.grey),),
              ),
              ListTile(
                leading: Icon(Icons.attach_money),
                title: Text(AppLocalizations.of(context).getTranslate("exchange")),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExchangeScreen()),
                  );
                  _advancedDrawerController.hideDrawer();
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.bookmark_add_outlined),
                title: Text(AppLocalizations.of(context).getTranslate("zakat_follows")),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ZakatScreen()),
                  );
                  _advancedDrawerController.hideDrawer();
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(AppLocalizations.of(context).getTranslate("settings")),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                  _advancedDrawerController.hideDrawer();
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(AppLocalizations.of(context).getTranslate("logout")),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  _advancedDrawerController.hideDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateZakat() {
    double tlSavings = double.tryParse(_tlSavingsController.text) ?? 0.0;
    double dollarSavings =
        double.tryParse(_dollarSavingsController.text) ?? 0.0;
    double euroSavings = double.tryParse(_euroSavingsController.text) ?? 0.0;
    double gold = double.tryParse(_goldController.text) ?? 0.0;
    double silver = double.tryParse(_silverController.text) ?? 0.0;

    // Girdileri topla
    double totalAssets =
        tlSavings + dollarSavings + euroSavings + gold + silver;

    double totalZakat = totalAssets * 0.025;

    setState(() {
      _totalZakat = totalZakat;
    });
  }
}
