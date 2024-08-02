import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tp_twitter/message/tweet.dart';

class MessageViewModel with ChangeNotifier {
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
        elevation: 10.0);

    // FAKE: Simuler un lag de 1 seconde
    await Future.delayed(Duration(seconds: 1));

    // l'url
    var url = Uri.parse(
        "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json");

    // appeler l'url
    var response = await http.get(url);

    // mapper la reponse en json
    var responseBodyJson = convert.jsonDecode(response.body);

    // mapper le json en liste de Tweet
    tweets = List<Tweet>.from(responseBodyJson
        .map((tweetJson) => Tweet.fromJson(tweetJson))
        .toList());

    // Fermer la popup de chargement
    pd!.close();

    // Rafraichir l'écran
    // setState(() {});
    notifyListeners();
  }
}
