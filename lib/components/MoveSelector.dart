import 'package:flutter/material.dart';

import './Moves.dart';

typedef MoveCallback = void Function(Moves move);

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
              _setMove(Moves.Paper);
            },
            child: Text("Papel"),
          ),
          RaisedButton(
            onPressed: () {
              _setMove(Moves.Rock);
            },
            child: Text("Pedra"),
          ),
          RaisedButton(
            onPressed: () {
              _setMove(Moves.Scissor);
            },
            child: Text("Tesoura"),
          )
        ],
      ),
    );
  }

  _setMove(Moves move) {
    this.onMoveChanged(move);
  }
}
