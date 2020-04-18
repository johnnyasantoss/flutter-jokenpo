import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../JokenPo.dart';
import './MoveSelector.dart';
import './MoveViewer.dart';
import 'Moves.dart';

class JokenPoGameVsAI extends StatefulWidget {
  JokenPoGameVsAI({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JokenPoGameVsAIState createState() => _JokenPoGameVsAIState();
}

class _JokenPoGameVsAIState extends State<JokenPoGameVsAI> {
  JokenPoVsAI game = new JokenPoVsAI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MoveViewer(
                  move: game.playerOneMove,
                  isWinner: game.winner == Winner.PlayerOne || game.winner == Winner.Draw,
                ),
                MoveViewer(
                  move: game.playerTwoMove,
                  isWinner: game.winner == Winner.PlayerTwo || game.winner == Winner.Draw,
                ),
              ],
            ),
            Text(
              "Selecione sua jogada",
              style: Theme.of(context).textTheme.headline,
            ),
            MoveSelector(onMoveChanged: (move) {
              setState(() {
                game.reset();
                game.playerOneMove = move;
              });
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playGame,
        tooltip: 'Jogar',
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  Future<bool> _playGame() async {
    if (game.isDone || game.playerOneMove == Moves.None) {
      await Fluttertoast.showToast(
          msg: "Você precisa selecionar sua jogada antes.",
          toastLength: Toast.LENGTH_SHORT
      );
      return false;
    }

    setState(() {
      game.play();
    });

    return true;
  }
}
