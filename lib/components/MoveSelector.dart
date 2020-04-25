import 'package:flutter/material.dart';
import 'package:jokenpo/components/MoveButton.dart';

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
          MoveButton(
            move: JokenPoMoves.Rock,
            onPressed: _setMove,
          ),
          MoveButton(
            move: JokenPoMoves.Paper,
            onPressed: _setMove,
          ),
          MoveButton(
            move: JokenPoMoves.Scissor,
            onPressed: _setMove,
          ),
        ],
      ),
    );
  }

  _setMove(JokenPoMoves move) {
    this.onMoveChanged(move);
  }
}
