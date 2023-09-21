import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';

class IconCheckRed extends StatefulWidget {
  const IconCheckRed({super.key});

  @override
  State<IconCheckRed> createState() => _IconCheckRedState();
}

class _IconCheckRedState extends State<IconCheckRed>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: hexToColor("#EEB3A7"),
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
