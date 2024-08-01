import 'package:flutter/material.dart';
import 'package:tp_twitter/Message.dart';

class MessageButton extends StatelessWidget {
  String imgPath;

  MessageButton(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: Image.asset(this.imgPath, width: 24));
  }
}

class MessageCard extends StatelessWidget {

  Message tweet;

  MessageCard(this.tweet);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network("https://avatar.iran.liara.run/public",
                      width: 96),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tweet.author,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("50s")
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              tweet.message,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MessageButton("reply.png"),
                    MessageButton("retweet.png"),
                    MessageButton("favorite.png")
                    // Text("Répondre"),
                    // Text("Retweet"),
                    // Text("Favoris")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
