import 'package:flutter/material.dart';
import 'package:tp_twitter/Message.dart';

import 'footer.dart';
import 'header.dart';
import 'message-card.dart';

class MyHomePage extends StatelessWidget {

  var tweets = [
    Message("shiba@gmail.com", "Icing marzipan candy canes pie soufflé apple pie pie. Pastry soufflé lollipop pudding shortbread carrot cake macaroon toffee. Sweet roll jelly beans donut chocolate marzipan pastry carrot cake."),
    Message("test@gmail.com", "Cupcake ipsum dolor sit amet carrot cake bonbon cotton candy. Macaroon cake fruitcake tiramisu tart tiramisu wafer. Ice cream ice cream croissant gummi bears marshmallow pie."),
    Message("truc@gmail.com", "Wafer chupa chups lollipop jelly pudding jelly-o. Biscuit cake shortbread jelly-o danish. Candy brownie marshmallow marshmallow tootsie roll."),
  ];

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
