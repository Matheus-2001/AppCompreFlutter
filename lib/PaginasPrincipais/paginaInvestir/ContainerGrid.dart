import 'package:flutter/material.dart';
import 'package:exemplo3/Conteudos/ConteudosContainerPrec.dart';
import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';
import 'package:exemplo3/PaginasPrincipais/paginaInvestir/paginaInvestir.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class ContainerGrid extends StatefulWidget {
  @override
  _ContainerGridState createState() => _ContainerGridState();
}

class _ContainerGridState extends State<ContainerGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PrecData1();
                      },
                      transitionDuration: Duration(
                          seconds: 0), // Defina a duração para 0 segundos
                    ),
                  );
                },
                child: Row(children: [
                  Container(
                      margin: EdgeInsets.only(left: 0, right: 4),
                      padding: EdgeInsets.all(15),
                      width: 190,
                      height: 97,
                      decoration: BoxDecoration(
                          color: hexToColor('#bceeb0'),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(children: [
                              Text(
                                "Federal",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.price_change,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ]),
                            Spacer(),
                            Text(
                              "R\$  1.000.000,00",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w700,
                                fontFamily: 'bornamedium',
                              ),
                            ),
                          ])),
                ]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PrecData1();
                      },
                      transitionDuration: Duration(
                          seconds: 0), // Defina a duração para 0 segundos
                    ),
                  );
                },
                child: Row(children: [
                  Container(
                      margin: EdgeInsets.only(left: 4, right: 0),
                      padding: EdgeInsets.all(15),
                      width: 190,
                      height: 97,
                      decoration: BoxDecoration(
                          color: hexToColor('#F4FAB4'),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(children: [
                              Text(
                                "Municipal",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.price_change,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ]),
                            Spacer(),
                            Text(
                              "R\$  25.600,00",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w700,
                                fontFamily: 'bornamedium',
                              ),
                            ),
                          ])),
                ]),
              ),
            ]),
          ),

          ///fileira 2
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PrecData1();
                      },
                      transitionDuration: Duration(
                          seconds: 0), // Defina a duração para 0 segundos
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 0, right: 4),
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 190,
                        height: 97,
                        decoration: BoxDecoration(
                            color: hexToColor('#bceeb0'),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text(
                                  "Estadual",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'bornamedium',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.sell,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ]),
                              Spacer(),
                              Text(
                                "R\$  200.000,00",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                            ])),
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PrecData1();
                      },
                      transitionDuration: Duration(
                          seconds: 0), // Defina a duração para 0 segundos
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 4, right: 0),
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 190,
                        height: 97,
                        decoration: BoxDecoration(
                            color: hexToColor('#F7B9AD'),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text(
                                  "Estadual",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'bornamedium',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.price_change,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ]),
                              Spacer(),
                              Text(
                                "R\$  120.000,00",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                            ])),
                  ]),
                ),
              ),
            ]),
          ),

          ///fileira 3
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PrecData1();
                      },
                      transitionDuration: Duration(
                          seconds: 0), // Defina a duração para 0 segundos
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 0, right: 4),
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 190,
                        height: 97,
                        decoration: BoxDecoration(
                            color: hexToColor('#F4FAB4'),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text(
                                  "Federal",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'bornamedium',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.price_change,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ]),
                              Spacer(),
                              Text(
                                "R\$  1.067.400,00",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                            ])),
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PrecData1();
                      },
                      transitionDuration: Duration(
                          seconds: 0), // Defina a duração para 0 segundos
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 4, right: 0),
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 190,
                        height: 97,
                        decoration: BoxDecoration(
                            color: hexToColor('#bceeb0'),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text(
                                  "Federal",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'bornamedium',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.sell,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ]),
                              Spacer(),
                              Text(
                                "R\$  10.000,00",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                            ])),
                  ]),
                ),
              ),
            ]),
          ),

          ///fileira 4
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PrecData1();
                      },
                      transitionDuration: Duration(
                          seconds: 0), // Defina a duração para 0 segundos
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 0, right: 4),
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 190,
                        height: 97,
                        decoration: BoxDecoration(
                            color: hexToColor('#F4FAB4'),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text(
                                  "Municipal",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'bornamedium',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.price_change,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ]),
                              Spacer(),
                              Text(
                                "R\$  10.000,00",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                            ])),
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PrecData1();
                      },
                      transitionDuration: Duration(
                          seconds: 0), // Defina a duração para 0 segundos
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 4, right: 0),
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 190,
                        height: 97,
                        decoration: BoxDecoration(
                            color: hexToColor('#bceeb0'),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text(
                                  "Estadual",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'bornamedium',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.sell,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ]),
                              Spacer(),
                              Text(
                                "R\$  10.000,00",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                            ])),
                  ]),
                ),
              ),
            ]),
          ),

          ///fileira 5
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PrecData1();
                      },
                      transitionDuration: Duration(
                          seconds: 0), // Defina a duração para 0 segundos
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 0, right: 4),
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 190,
                        height: 97,
                        decoration: BoxDecoration(
                            color: hexToColor('#F7B9AD'),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text(
                                  "Estadual",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'bornamedium',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.price_change,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ]),
                              Spacer(),
                              Text(
                                "R\$  10.000,00",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                            ])),
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return PrecData1();
                      },
                      transitionDuration: Duration(
                          seconds: 0), // Defina a duração para 0 segundos
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 4, right: 0),
                  child: Row(children: [
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 190,
                        height: 97,
                        decoration: BoxDecoration(
                            color: hexToColor('#bceeb0'),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text(
                                  "Federal",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'bornamedium',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.price_change,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ]),
                              Spacer(),
                              Text(
                                "R\$  10.000,00",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                            ])),
                  ]),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
