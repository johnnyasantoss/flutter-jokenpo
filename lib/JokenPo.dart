import 'dart:math';

import 'enums/JokenPoMoves.dart';
import './enums/Winner.dart';

abstract class JokenPo {
  JokenPoMoves playerOneMove = JokenPoMoves.None;
  JokenPoMoves playerTwoMove = JokenPoMoves.None;

  Winner _winner = Winner.None;

  Winner get winner => _winner;

  bool get isDone => winner != Winner.None;

  void reset() {
    playerOneMove = JokenPoMoves.None;
    playerTwoMove = JokenPoMoves.None;
    _winner = Winner.None;
  }

  bool play() {
    if (!checkCanPlay()) {
      return false;
    }

    _winner = checkWinner();

    return true;
  }

  Winner checkWinner() {
    if (playerOneMove == playerTwoMove) {
      return Winner.Draw;
    }

    if ((playerOneMove == JokenPoMoves.Rock &&
            playerTwoMove == JokenPoMoves.Scissor) ||
        (playerOneMove == JokenPoMoves.Scissor &&
            playerTwoMove == JokenPoMoves.Paper) ||
        (playerOneMove == JokenPoMoves.Paper &&
            playerTwoMove == JokenPoMoves.Rock)) {
      return Winner.PlayerOne;
    }

    return Winner.PlayerTwo;
  }

  bool checkCanPlay() {
    return !isDone &&
        playerOneMove != JokenPoMoves.None &&
        playerTwoMove != JokenPoMoves.None;
  }
}

mixin JokenPoPlayerTwoAI on JokenPo {
  final Random random = new Random();

  JokenPoMoves generateAIMove() {
    var index = random.nextInt(JokenPoMoves.values.length - 1) + 1;

    return JokenPoMoves.values[index];
  }
}

class JokenPoVsAI extends JokenPo with JokenPoPlayerTwoAI {
  @override
  bool play() {
    this.playerTwoMove = this.generateAIMove();
    return super.play();
  }
}
