import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';

class IconCheckGreen extends StatefulWidget {
  const IconCheckGreen({super.key});

  @override
  State<IconCheckGreen> createState() => _IconCheckGreenState();
}

class _IconCheckGreenState extends State<IconCheckGreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: hexToColor("#6A8D40"),
        child: Center(
          child: Padding(
              padding: EdgeInsets.only(top: 0, right: 0),
              child: RiveAnimation.asset(
                'assets/CheckGreen.riv',
              )),
        ),
      ),
    );
  }
}
