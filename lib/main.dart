import 'package:flutter/material.dart';
import 'package:tp_twitter/auth/app-theme.dart';
import 'package:tp_twitter/auth/auth-page.dart';

import 'home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP Twitter',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
          appBarTheme: AppTheme.appBarTheme),
      initialRoute: "/",
      routes: {
        "/": (context) => AuthPage(),
        "/messages": (context) => MyHomePage()
      },
    );
  }
}
