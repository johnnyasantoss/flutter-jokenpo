enum JokenPoMoves { None, Rock, Paper, Scissor }

extension JokenPoMovesExtensions on JokenPoMoves {
  String getImage() {
    String imagePath;

    switch (this) {
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

    return imagePath;
  }

  String getText() {
    String text;

    switch (this) {
      case JokenPoMoves.Rock:
        text = "Pedra";
        break;
      case JokenPoMoves.Paper:
        text = "Papel";
        break;
      case JokenPoMoves.Scissor:
        text = "Tesoura";
        break;
      default:
        text = "";
        break;
    }

    return text;
  }
}
