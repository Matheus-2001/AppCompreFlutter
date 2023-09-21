import 'package:exemplo3/PaginasPrincipais/paginaInvestir/paginaInvestir.dart';
import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class PrecData1 extends StatefulWidget {
  @override
  _PrecData1State createState() => _PrecData1State();
}

class _PrecData1State extends State<PrecData1> {
  bool _isBoxVisible = false;

  void _toggleBoxVisibility() {
    setState(() {
      _isBoxVisible = !_isBoxVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: hexToColor("#F5F5F5"),
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              SizedBox(
                height: 80,
              ),

              ///Header
              Row(children: [
                IconButton(
                    padding: EdgeInsets.only(
                      left: 40,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return InvestirTab();
                          },

                          /// função para criar transição na troca de página
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            /// Begin = 0 para não ter animação de transição
                            const begin = Offset(0, 0);
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
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 26,
                      color: Colors.grey,
                    )),
                Spacer(),
                Text(
                  'Detalhe',
                  style: TextStyle(
                      color: hexToColor('#6c757d'),
                      fontSize: 26,
                      fontFamily: 'bornamedium'),
                ),
                Spacer(),
                Icon(
                  Icons.star,
                  size: 24,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 40,
                ),
              ]),

              SizedBox(
                height: 20,
              ),

              ///Primeiro Container arredondado
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding:
                    EdgeInsets.only(left: 20, top: 15, right: 10, bottom: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: hexToColor("#012B31"),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Alinha verticalmente no centro.
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alinha horizontalmente no início (esquerda).
                      children: [
                        Text(
                          "Rendimento esperado",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'bornamedium',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '+22,89% ',
                                style: TextStyle(
                                  color: hexToColor("#12A700"),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 36,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                              TextSpan(
                                text: 'a.a.',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                            ],
                          ),
                        ))
                      ]),
                  Spacer(),
                  Column(children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                      decoration: BoxDecoration(
                          color: hexToColor("#AEFFA3"),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                        size: 56,
                      ),
                    )
                  ])
                ]),
              ),
              SizedBox(
                height: 30,
              ),

              ///Texto e valores
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Valor do precatório",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'bornamedium',
                          ),
                        ),
                        Text(
                          "R\$ 345.009,00",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 36,
                            fontFamily: 'bornamedium',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          Text(
                            "Valor do recebimento",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontFamily: 'bornamedium',
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: _toggleBoxVisibility,
                            child: Icon(
                              Icons.help_outline,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ]),
                        Stack(children: [
                          AnimatedContainer(
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 150),
                            width: double.infinity,
                            height: _isBoxVisible ? 105 : 40,
                            child: Text(
                              "R\$ 398.800,00",
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 36,
                                fontFamily: 'bornamedium',
                              ),
                            ),
                          ),
                          if (_isBoxVisible)
                            Positioned(
                              top: 0,
                              left: 40,
                              // Adjst this value to control the position
                              child: Container(
                                width: 250,
                                height: 105,
                                padding: EdgeInsets.only(left: 15, right: 15),
                                decoration: BoxDecoration(
                                  color: hexToColor('#616161'),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Valor calculado com base na expectativa de rendimentos até o efetivo pagamento pelo ente devedor. Esse valor é meramente especulatório e não deve ser considerado para fins de tributos e/ou comissões e taxas.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'bornamedium',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                        ]),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Melhor oferta",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'bornamedium',
                          ),
                        ),
                        Text(
                          "R\$ 185.000,00",
                          style: TextStyle(
                            color: hexToColor('#15a700'),
                            fontSize: 36,
                            fontFamily: 'bornamedium',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Encerra às 23:00h do dia 30/05/2023 (ou a qualquer momento por iniciativa do vendedor)",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 14,
                              fontFamily: 'bornamedium',
                              fontWeight: FontWeight.w700),
                        ),
                      ])),
              SizedBox(
                height: 60,
              ),

              /// Acaba textos e valores
              ///começa Outras informações
              Container(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 30, bottom: 5),
                          child: Text("Outras informações",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 25,
                                fontFamily: 'bornamedium',
                              ))),
                      Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 20, bottom: 20),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(children: [
                            Container(
                              width: 100,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tipo:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'bornamedium'),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Tribunal:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'bornamedium'),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Ente\ndevedor:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'bornamedium'),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Natureza:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'bornamedium'),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Objeto:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'bornamedium'),
                                    ),
                                  ]),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Federal',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: hexToColor('#002b31'),
                                        fontFamily: 'bornamedium',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'TRF-1',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: hexToColor('#002b31'),
                                        fontFamily: 'bornamedium',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'União',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: hexToColor('#002b31'),
                                        fontFamily: 'bornamedium',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    'Alimentar',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: hexToColor('#002b31'),
                                        fontFamily: 'bornamedium',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Gratificação de férias e\ngratificação natalina',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: hexToColor('#002b31'),
                                        fontFamily: 'bornamedium',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ]),
                          ])),
                      SizedBox(
                        height: 80,
                      ),
                    ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
