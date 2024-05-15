// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zekatcalculate/core/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/client/client_cubit.dart';
import 'core/localizations.dart';
import 'core/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientCubit(
        ClientState(darkMode: false, language: "en")
      ),
      child: BlocBuilder<ClientCubit, ClientState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Zekat Hesaplayıcı',
            debugShowCheckedModeBanner: false,
            routerConfig: routes,
            themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('tr', 'TR'),
         
          ],
          locale: Locale(state.language),
          );
        }
      ),
    );
  }
}