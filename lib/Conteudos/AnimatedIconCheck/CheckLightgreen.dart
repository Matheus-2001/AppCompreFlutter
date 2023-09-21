import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';

class IconCheckLightGreen extends StatefulWidget {
  const IconCheckLightGreen({super.key});

  @override
  State<IconCheckLightGreen> createState() => _IconCheckLightGreenState();
}

class _IconCheckLightGreenState extends State<IconCheckLightGreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: hexToColor("#a5d19b"),
        child: Center(
          child: Padding(
              padding: EdgeInsets.only(top: 0, right: 0),
              child: RiveAnimation.asset(
                'assets/CheckLightGreen.riv',
              )),
        ),
      ),
    );
  }
}
