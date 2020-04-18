import 'package:flutter/material.dart';

import '../enums/JokenPoMoves.dart';

class MoveViewer extends StatelessWidget {
  final JokenPoMoves move;
  final bool isWinner;

  MoveViewer({@required this.move, @required this.isWinner, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath;

    switch (move) {
      case JokenPoMoves.Rock:
        imagePath = "assets/imgs/pedra.png";
        break;
      case JokenPoMoves.Paper:
        imagePath = "assets/imgs/papel.png";
        break;
      case JokenPoMoves.Scissor:
        imagePath = "assets/imgs/tesoura.png";
        break;
      default:
        imagePath = "assets/imgs/nenhum.png";
        break;
    }

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        //TODO: Achar melhor forma de mostrar ganhador
        padding: EdgeInsets.fromLTRB(1, 1, 3, 3),
        decoration: BoxDecoration(
          color: isWinner ? Theme.of(context).primaryColor : null,
        ),
        child: Image.asset(
          imagePath,
          height: 100,
        ),
      ),
    );
  }
}
