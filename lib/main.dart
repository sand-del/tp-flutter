import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tp_twitter/app-theme.dart';
import 'package:tp_twitter/auth-page.dart';
import 'package:tp_twitter/message-card.dart';

import 'footer.dart';
import 'header.dart';

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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Message"),
          centerTitle: true),
      body: Center(
        child: Column(children: [
          HeaderWidget(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MessageCard(),
              ],
            ),
          )),
          FooterWidget()
        ]),
      ),
    );
  }
}
