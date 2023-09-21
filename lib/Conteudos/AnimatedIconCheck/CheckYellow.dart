import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';

class IconCheckYellow extends StatefulWidget {
  const IconCheckYellow({super.key});

  @override
  State<IconCheckYellow> createState() => _IconCheckYellowState();
}

class _IconCheckYellowState extends State<IconCheckYellow>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: hexToColor("#EAF0AE"),
        child: Center(
          child: Padding(
              padding: EdgeInsets.only(top: 0, right: 0),
              child: RiveAnimation.asset(
                'assets/CheckYellow.riv',
              )),
        ),
      ),
    );
  }
}
