import 'package:flutter/material.dart';
import 'package:flutterfootballplayers/services/repository.dart';
import 'package:flutterfootballplayers/themes/themes.dart';
import 'package:flutterfootballplayers/widgets/horizontal_bar.dart';

class HomePage extends StatelessWidget {
  final PlayerRepository playerRepository;

  HomePage({this.playerRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Football Players', style: appBarTextStyle),
      ),
      body: Column(
        children: <Widget>[
          HorizontalBar(),
          SizedBox(height: 10.0),
//          PlayersrsList()
        ],
      ),
    );
  }
}
