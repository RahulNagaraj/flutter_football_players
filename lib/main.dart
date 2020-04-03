import 'package:flutter/material.dart';
import 'package:flutterfootballplayers/pages/HomePage.dart';
import 'package:flutterfootballplayers/services/repository.dart';

void main() {
  PlayerRepository _playerRepository = PlayerRepository();
  runApp(MyApp(playerRepository: _playerRepository));
}

class MyApp extends StatelessWidget {
  final PlayerRepository playerRepository;
  MyApp({this.playerRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football',
      home: HomePage(playerRepository: playerRepository)
    );
  }
}
