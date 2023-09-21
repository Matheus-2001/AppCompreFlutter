import 'package:flutter/material.dart';
import 'package:exemplo3/Conteudos/ConteudosContainerPrec.dart';
import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';
import 'package:exemplo3/PaginasPrincipais/paginaInvestir/ContainerGrid.dart';
import 'package:exemplo3/PaginasPrincipais/paginaInvestir/BotõesFiltros.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class InvestirTab extends StatefulWidget {
  @override
  _InvestirTabState createState() => _InvestirTabState();
}

class _InvestirTabState extends State<InvestirTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: hexToColor("#F4F4F4"),
          child: Column(children: [
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 40),
                    // Adiciona espaço à direita do ícone
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return MyScrollablePage();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(0, -1);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 26,
                        color: Colors.grey,
                      ),
                    )),
                Spacer(),
                Container(
                    margin: EdgeInsets.only(right: 40),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.grey.shade300;
                            }
                            return Colors.transparent;
                          },
                        ),
                        elevation:
                            MaterialStateProperty.all(0), // Remova a elevação
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent), // Cor de fundo do botão
                      ),
                      child: Icon(
                        Icons.tune,
                        size: 26,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              height: 680,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors
                                                .grey.shade300, // Cor da borda
                                            width: 1.0, // Largura da borda
                                          ),
                                        ),
                                      ),
                                      child: Row(children: [
                                        Text(
                                          "Filtros",
                                          style: TextStyle(
                                              color: hexToColor('#6c757d'),
                                              fontSize: 25,
                                              fontFamily: 'bornamedium'),
                                        ),
                                        Spacer(),
                                        IconButton(
                                          icon: Icon(Icons.close),
                                          iconSize: 25,
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Fecha o BottomSheet
                                          },
                                        )
                                      ])),
                                  FiltrosButtons(),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    )),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Investir",
                style: TextStyle(
                    color: hexToColor('#6c757d'),
                    fontSize: 28,
                    fontFamily: 'bornamedium'),
              ),
            ),

            /// começo container grid
            ContainerGrid(),

            Container(
                margin: EdgeInsets.only(left: 30, top: 30),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "Legenda:",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: hexToColor("#6c757d"),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'bornamedium'),
                  )
                ])),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(children: [
                  Icon(
                    Icons.sell,
                    color: hexToColor("#6c757d"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Valor fechado",
                    style: TextStyle(
                        color: hexToColor("#6c757d"),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'bornamedium'),
                  ),
                  Spacer(),
                  Icon(
                    Icons.price_change,
                    color: hexToColor("#6c757d"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Melhor oferta",
                    style: TextStyle(
                        color: hexToColor("#6c757d"),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'bornamedium'),
                  ),
                ]))
          ])),
    );
  }
}
