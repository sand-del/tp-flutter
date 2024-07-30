import 'dart:ui';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF55a4e0)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF55a4e0),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.indigo, Color(0xFF54A2DE)])),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text("Nouveau", style: TextStyle(color: Colors.white)),
          Text("Accueil", style: TextStyle(color: Colors.white)),
          Text("Rechercher", style: TextStyle(color: Colors.white))
        ]),
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text("Fil", style: TextStyle(color: Colors.grey)),
          Text("Notification", style: TextStyle(color: Colors.grey)),
          Text("Message", style: TextStyle(color: Colors.grey)),
          Text("Moi", style: TextStyle(color: Colors.grey))
        ]),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Message"),
          centerTitle: true),
      body: Center(
        child: Column(children: [
          HeaderWidget(),
          Expanded(
              child: Container(
                  child: Column(
            children: [
              SizedBox(
                height: 180,
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.network("https://avatar.iran.liara.run/public",
                              width: 96),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "test@test.com",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("50s")
                                    ],
                                  ),
                                  Text(
                                      "Muffin liquorice brownie tootsie roll tootsie roll halvah sesame snaps donut candy. Cotton candy chocolate cake pudding marzipan soufflé. Jujubes cake gummi bears gummies fruitcake. Muffin macaroon cheesecake jelly-o topping wafer. Muffin liquorice brownie tootsie roll tootsie roll halvah sesame snaps donut candy. Cotton candy chocolate cake pudding marzipan soufflé. Jujubes cake gummi bears gummies fruitcake. Muffin macaroon cheesecake jelly-o topping wafer.",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Répondre"),
                            Text("Retweet"),
                            Text("Favoris")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ))),
          FooterWidget()
        ]),
      ),
    );
  }
}
