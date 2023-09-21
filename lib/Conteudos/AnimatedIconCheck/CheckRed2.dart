import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';

class IconCheckRed2 extends StatefulWidget {
  const IconCheckRed2({super.key});

  @override
  State<IconCheckRed2> createState() => _IconCheckRed2State();
}

class _IconCheckRed2State extends State<IconCheckRed2>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Padding(
              padding: EdgeInsets.only(top: 0, right: 0),
              child: RiveAnimation.asset(
                'assets/Check1.riv',
              )),
        ),
      ),
    );
  }
}
