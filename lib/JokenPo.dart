import 'dart:math';

import 'components/Moves.dart';

enum Winner { None, PlayerOne, PlayerTwo, Draw }

abstract class JokenPo {
  Moves playerOneMove = Moves.None;
  Moves playerTwoMove = Moves.None;

  Winner _winner = Winner.None;

  Winner get winner => _winner;

  bool get isDone => winner != Winner.None;

  void reset() {
    playerOneMove = Moves.None;
    playerTwoMove = Moves.None;
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

    if ((playerOneMove == Moves.Rock && playerTwoMove == Moves.Scissor) ||
        (playerOneMove == Moves.Scissor && playerTwoMove == Moves.Paper) ||
        (playerOneMove == Moves.Paper && playerTwoMove == Moves.Rock)) {
      return Winner.PlayerOne;
    }

    return Winner.PlayerTwo;
  }

  bool checkCanPlay() {
    return !isDone && playerOneMove != Moves.None && playerTwoMove != Moves.None;
  }
}

mixin JokenPoPlayerTwoAI on JokenPo {
  final Random random = new Random();

  Moves generateAIMove() {
    var index = random.nextInt(Moves.values.length - 1) + 1;

    return Moves.values[index];
  }
}

class JokenPoVsAI extends JokenPo with JokenPoPlayerTwoAI {
  @override
  bool play() {
    this.playerTwoMove = this.generateAIMove();
    return super.play();
  }
}
