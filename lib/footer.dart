import 'package:flutter/material.dart';

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