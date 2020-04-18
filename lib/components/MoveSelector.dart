import 'package:flutter/material.dart';

import '../enums/JokenPoMoves.dart';

typedef MoveCallback = void Function(JokenPoMoves move);

class MoveSelector extends StatelessWidget {
  final MoveCallback onMoveChanged;

  MoveSelector({Key key, @required this.onMoveChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _setMove(JokenPoMoves.Paper);
            },
            child: Text("Papel"),
          ),
          RaisedButton(
            onPressed: () {
              _setMove(JokenPoMoves.Rock);
            },
            child: Text("Pedra"),
          ),
          RaisedButton(
            onPressed: () {
              _setMove(JokenPoMoves.Scissor);
            },
            child: Text("Tesoura"),
          )
        ],
      ),
    );
  }

  _setMove(JokenPoMoves move) {
    this.onMoveChanged(move);
  }
}
