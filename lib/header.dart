import 'package:flutter/material.dart';

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
          IconButton(onPressed: (){}, icon: Image.asset("pencil.png", width: 24)),
          Text("Accueil", style: TextStyle(color: Colors.white)),
          IconButton(onPressed: (){}, icon: Image.asset("search.png", width: 24)),
          // Text("Nouveau", style: TextStyle(color: Colors.white)),
          // Text("Accueil", style: TextStyle(color: Colors.white)),
          // Text("Rechercher", style: TextStyle(color: Colors.white))
        ]),
      ),
    );
  }
}