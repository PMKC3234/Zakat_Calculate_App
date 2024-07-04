// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zekatcalculate/screens/core/change_language.dart';
import 'package:zekatcalculate/screens/notifications.dart';
import 'package:zekatcalculate/screens/profile.dart';
import '../bloc/client/client_cubit.dart';
import '../core/localizations.dart';
import '../widgets/myappbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: AppLocalizations.of(context).getTranslate("settings"),
        ),
        body: SettingsList(),
      ),
    );
  }
}

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        
        SettingsListItem(
          icon: Icons.person,
          title: AppLocalizations.of(context).getTranslate("profile"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
        SettingsListItem(
          icon: Icons.notifications,
          title: AppLocalizations.of(context).getTranslate("notifications"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          },
        ),
        SettingsListItem(
          icon: Icons.language,
          title: AppLocalizations.of(context).getTranslate("language"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Change_LanguageScreen()),
            );
          },
        ),
        Card(
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  context.read<ClientCubit>().state.darkMode
                      ? Icons.nightlight
                      : Icons.wb_sunny,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  AppLocalizations.of(context).getTranslate("mode") +
                      (context.read<ClientCubit>().state.darkMode
                          ? AppLocalizations.of(context).getTranslate("night")
                          : AppLocalizations.of(context).getTranslate("light")),
                ),
                trailing: Switch(
                  value: context.read<ClientCubit>().state.darkMode,
                  onChanged: (bool newValue) {
                    // Gece modu geçişini yapar
                    context
                        .read<ClientCubit>()
                        .changeDarkMode(newValue, darkMode: true);
                    // Gündüz modu geçişi için bir kontrol yapar
                    if (!newValue) {
                      context
                          .read<ClientCubit>()
                          .changeDarkMode(newValue, darkMode: false);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SettingsListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const SettingsListItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
