import 'package:flutter/material.dart';
import 'package:tp_twitter/Message.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tp_twitter/tweet.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import 'footer.dart';
import 'header.dart';
import 'message-card.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var tweets = [
  //   Message("shiba@gmail.com", "Icing marzipan candy canes pie soufflé apple pie pie. Pastry soufflé lollipop pudding shortbread carrot cake macaroon toffee. Sweet roll jelly beans donut chocolate marzipan pastry carrot cake."),
  //   Message("test@gmail.com", "Cupcake ipsum dolor sit amet carrot cake bonbon cotton candy. Macaroon cake fruitcake tiramisu tart tiramisu wafer. Ice cream ice cream croissant gummi bears marshmallow pie."),
  //   Message("truc@gmail.com", "Wafer chupa chups lollipop jelly pudding jelly-o. Biscuit cake shortbread jelly-o danish. Candy brownie marshmallow marshmallow tootsie roll."),
  // ];

// Ma liste de tweets vide par défaut
  List<Tweet> tweets = [];

  /// Appel l'api
  void callApi(BuildContext context) async {
    // Afficher popup chargement
    var pd = ProgressDialog(context: context);

    pd!.show(
        msg: "Récupération des messages en cours",
        barrierColor: Color(0x77000000),
        progressBgColor: Colors.transparent,
        elevation: 10.0
    );

    // FAKE: Simuler un lag de 1 seconde
    await Future.delayed(Duration(seconds: 1));

    // l'url
    var url = Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json");

    // appeler l'url
    var response = await http.get(url);

    // mapper la reponse en json
    var responseBodyJson = convert.jsonDecode(response.body);

    // mapper le json en liste de Tweet
    tweets = List<Tweet>.from(responseBodyJson.map((tweetJson) => Tweet.fromJson(tweetJson)).toList());

    // Fermer la popup de chargement
    pd!.close();

    // Rafraichir l'écran
    setState(() {});
  }

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
          ElevatedButton(
              onPressed: () {
                callApi(context);
              },
              child: Text("Rafraichir messages")),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: tweets.length,
                            itemBuilder: (BuildContext context, int index) {
                              // Récupérer la donnée Tweet dans la liste
                              var tweet = tweets[index];
                              // Retourner/Afficher la carte tweet en envoyer le modèle Tweet dans la carte
                              return MessageCard(tweet);
                            }))
                  ],
                ),
              )),
          FooterWidget()
        ]),
      ),
    );
  }
}
