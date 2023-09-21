import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';

class IconCheck extends StatefulWidget {
  const IconCheck({super.key});

  @override
  State<IconCheck> createState() => _IconCheckState();
}

class _IconCheckState extends State<IconCheck>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: hexToColor("#01292F"),
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
