import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../enums/JokenPoMoves.dart';

typedef MoveCallback = void Function(JokenPoMoves move);

class MoveButton extends StatelessWidget {
  final MoveCallback onPressed;
  final JokenPoMoves move;

  MoveButton({Key key, @required this.onPressed, @required this.move})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        this.move.getImage(),
        semanticLabel: this.move.getText(),
        height: 100,
      ),
      behavior: HitTestBehavior.opaque,
      onTap: () {
        this.onPressed(this.move);
      },
      onLongPress: () async {
        await Fluttertoast.showToast(
            msg: this.move.getText(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER
        );
      },
    );
  }
}
