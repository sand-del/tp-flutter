import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_twitter/message/message-viewmodel.dart';

import 'footer.dart';
import 'header.dart';
import 'message/message-card.dart';

class MyHomePage extends StatelessWidget {
  MessageViewModel viewModel = MessageViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
            // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Message"),
            centerTitle: true),
        body: Center(
          child: Column(children: [
            HeaderWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    viewModel.callApi(context);
                  },
                  child: Text("Rafraichir messages")),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(child: Consumer<MessageViewModel>(
                    builder: (context, viewModel, child) {
                      return ListView.builder(
                          itemCount: viewModel.tweets.length,
                          itemBuilder: (BuildContext context, int index) {
                            // Récupérer la donnée Tweet dans la liste
                            var tweet = viewModel.tweets[index];
                            // Retourner/Afficher la carte tweet en envoyer le modèle Tweet dans la carte
                            return MessageCard(tweet);
                          });
                    },
                  ))
                ],
              ),
            )),
            FooterWidget()
          ]),
        ),
      ),
    );
  }
}
