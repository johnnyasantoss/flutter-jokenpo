import 'package:flutter/material.dart';

import 'components/JokenPoGameVsAI.dart';

void main() => runApp(MaterialApp(
      title: 'JokenPo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JokenPoGameVsAI(title: 'Jogo JokenPo'),
    ));
