import 'package:exemplo3/PaginasPrincipais/Login/Login.dart';
import 'package:exemplo3/PaginasPrincipais/paginaInvestir/paginaInvestir.dart';
import 'package:exemplo3/PaginasPrincipais/paginaVender/paginaVender.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:exemplo3/Conteudos/ConteudosContainerPrec.dart';
import 'package:exemplo3/Conteudos/AnimatedIconCheck/AnimatedCheck.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyScrollablePage extends StatefulWidget {
  @override
  _MyScrollablePageState createState() => _MyScrollablePageState();
}

class _MyScrollablePageState extends State<MyScrollablePage> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -0.1),
            end: Alignment(0.0, 0.2),
            colors: [
              hexToColor("#002b31"), // Cor de cima
              hexToColor("#F5F5F5"), // Cor de baixo
            ],
          ),
        ),
        child: RefreshIndicator(
          backgroundColor: hexToColor("#002b31"),
          color: hexToColor("#12A700"),
          onRefresh: () async {},
          child: Stack(children: [
            if (activeTab == 0)
              SingleChildScrollView(
                child: Column(
                  children: [
                    Header(),
                    HeaderInfo(),
                    MainInfo(),
                  ],
                ),
              ),

            ///Página Investir Menu 3
            if (activeTab == 2) InvestirTab(),
          ]),
        ),
      ),
      //Menu abas flutuante
      floatingActionButton: activeTab == 0
          ? Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: hexToColor("#012B31"), // Cor de fundo do botão
                borderRadius: BorderRadius.circular(80),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        activeTab = 0;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          child: Image(
                              width: 60.0,
                              height: 60.0,
                              image: CachedNetworkImageProvider(
                                'https://comprecatorios.com.br/compre/assets/img/ComPre_icone-9.png',
                                maxWidth: 120,
                                maxHeight: 150,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),

                  ///Chamando a página Vender menu 2
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return VenderTab();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
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
                    child: Row(
                      children: [
                        Icon(Icons.sell, color: Colors.white),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return InvestirTab();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0, 1);
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
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : null,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: hexToColor("#002b31"),
      child: Padding(
        padding: EdgeInsets.only(top: 60, right: 20, left: 15),
        child: Row(
          children: [
            Container(
              width: 140,
              child: Image(
                  image: CachedNetworkImageProvider(
                "https://comprecatorios.com.br/compre/assets/img/ComPre_logotipo-2.png",
                maxWidth: 420,
                maxHeight: 154,
              )),
            ),
            Spacer(),
            Container(
                width: 145,
                height: 40,
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                    left: 0,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 30),
                  Positioned(
                    left: 49,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 30),
                  Positioned(
                      right: 0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.white.withOpacity(0.3);
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
                          Icons.account_circle,
                          size: 26,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                height: 600,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey
                                                  .shade300, // Cor da borda
                                              width: 1.0, // Largura da borda
                                            ),
                                          ),
                                        ),
                                        child: Row(children: [
                                          Text(
                                            "Matheus Rodrigues",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
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
                                    Spacer(),

                                    ///icon account com função de abrir menu para sair da conta
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                  secondaryAnimation) {
                                                return Login();
                                              },
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                const begin = Offset(-1, 0);
                                                const end = Offset.zero;
                                                const curve = Curves.easeInOut;
                                                var tween = Tween(
                                                        begin: begin, end: end)
                                                    .chain(CurveTween(
                                                        curve: curve));
                                                var offsetAnimation =
                                                    animation.drive(tween);

                                                return SlideTransition(
                                                  position: offsetAnimation,
                                                  child: child,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: hexToColor("#F7D5CF"),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12),
                                          margin: EdgeInsets.all(20),
                                          child: Center(
                                            child: Text(
                                              "Sair",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: hexToColor('#F07F65'),
                                                  fontSize: 16,
                                                  fontFamily: 'bornamedium'),
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ))
                ]))
          ],
        ),
      ),
    );
  }
}

class HeaderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 30,
            left: 20,
            right: 20,
          ),
          width: double.infinity,
          color: hexToColor("#002b31"),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Alinha os filhos à esquerda
            children: [
              SizedBox(height: 10),
              Text(
                "Olá, Matheus!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'bornamedium',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                // Remover espaço vertical acima do texto
                child: Row(
                  children: [
                    Text(
                      "Meus precatórios",
                      style: TextStyle(
                        fontSize: 16,
                        color: hexToColor("#15a700"),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'bornamedium',
                      ),
                    ),
                    SizedBox(width: 20),
                    Transform.scale(
                      scale: 0.65, // Defina o fator de escala desejado
                      child: Icon(
                        Icons.remove_red_eye,
                        color: hexToColor("#15a700"),
                      ),
                    ),
                    Spacer(),
                    Transform.scale(
                        scale: 0.45, // Defina o fator de escala desejado
                        child: Transform.rotate(
                          angle: 3.14159265,
                          // Ângulo de rotação em radianos (180 graus)
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: hexToColor("#15a700"),
                          ),
                        )),
                  ],
                ),
              ),
              Text(
                "R\$ 517.841,81",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'bornamedium',
                ),
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.7, // Defina o fator de escala desejado
                    child: Icon(
                      Icons.signal_cellular_alt,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(width: 5), // Espaço horizontal de 50 pixels
                  Text(
                    "Seu dinheiro já rendeu",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'bornamedium',
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "+22,87%",
                    style: TextStyle(
                      fontSize: 14,
                      color: hexToColor("#15a700"),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'bornamedium',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 0, bottom: 0),
          width: double.infinity,
          child: Transform.scale(
            scale: 1.1,
            child: Image(
                image: CachedNetworkImageProvider(
              "https://comprecatorios.com.br/compre/assets/img/grafico_exemplo.png",
              maxWidth: 400,
              maxHeight: 400,
            )),
          ),
        ),
      ],
    );
  }
}

class MainInfo extends StatefulWidget {
  const MainInfo({Key? key}) : super(key: key);

  @override
  State<MainInfo> createState() => _MainInfoState();
}

class _MainInfoState extends State<MainInfo> {
  static const IconData gavel = IconData(0xe2d3, fontFamily: 'MaterialIcons');

  final TextStyle c = TextStyle(
    fontSize: 24,
    color: hexToColor("#6C757D"),
    fontWeight: FontWeight.w500,
  );

  /// List of Tab Bar Item
  List<String> items = [
    "Todos",
    "Lances",
    "Compras",
    "Vendas",
  ];

  /// List of body icon
  List<Container> containerList(BuildContext context) {
    ///Container 1
    return [
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Lances',
                style: TextStyle(
                    fontSize: 24,
                    color: hexToColor("#6C757D"),
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PrecData1(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(20),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Valor do precatório",
                            style: TextStyle(
                              fontSize: 11,
                              color: hexToColor("#6C757D"),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'bornamedium',
                            ),
                          ),
                          Spacer(),
                          Text("Valor ofertado",
                              style: TextStyle(
                                fontSize: 11,
                                color: hexToColor("#6C757D"),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'bornamedium',
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("25 abr 2023",
                              style: TextStyle(
                                fontSize: 15,
                                color: hexToColor("#6C757D"),
                                fontWeight: FontWeight.w800,
                                fontFamily: 'bornamedium',
                              )),
                          Spacer(),
                          Text(
                            "R\$ 50.000,00",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Transform.scale(
                              scale: 0.45, // Defina o fator de escala desejado
                              child: Transform.rotate(
                                angle: 3.14159265,
                                // Ângulo de rotação em radianos (180 graus)
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: hexToColor("#15a700"),
                                ),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            gavel,
                            size: 12, // Defina o tamanho desejado aqui
                          ),
                          SizedBox(width: 10),
                          Text("R\$ 210.000,00",
                              style: TextStyle(
                                fontSize: 11,
                                color: hexToColor("#6C757D"),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'bornamedium',
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Compras',
                style: TextStyle(
                    fontSize: 24,
                    color: hexToColor("#6C757D"),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              padding: EdgeInsets.all(20),
              height: 295,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PrecData1(),
                          ),
                        );
                      },
                      child: Column(children: [
                        Row(
                          children: [
                            Text(
                              "Valor do precatório",
                              style: TextStyle(
                                fontSize: 11,
                                color: hexToColor("#6C757D"),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'bornamedium',
                              ),
                            ),
                            Spacer(),
                            Text("Valor da transação",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: hexToColor("#6C757D"),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'bornamedium',
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("25 mai 2023",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: hexToColor("#6C757D"),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'bornamedium',
                                )),
                            Spacer(),
                            Text(
                              "+R\$ 85.800,00",
                              style: TextStyle(
                                  fontSize: 14, color: hexToColor("#15a700")),
                            ),
                            Transform.scale(
                                scale:
                                    0.45, // Defina o fator de escala desejado
                                child: Transform.rotate(
                                  angle: 3.14159265,
                                  // Ângulo de rotação em radianos (180 graus)
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.grey,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.call_received,
                              size: 12,
                              color: Colors
                                  .green, // Defina o tamanho desejado aqui
                            ),
                            SizedBox(width: 10),
                            Text("R\$ 145.500,00",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: hexToColor("#6C757D"),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'bornamedium',
                                )),
                            Spacer(),
                            Text("Aguardando pagamento",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: hexToColor("#002b31"),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'bornamedium',
                                )),
                          ],
                        ),
                      ]),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PrecData1(),
                          ),
                        );
                      },
                      child: Column(children: [
                        Row(
                          children: [
                            Text("15 abr 2023",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: hexToColor("#6C757D"),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'bornamedium',
                                )),
                            Spacer(),
                            Text(
                              "+R\$ 250.000,00",
                              style: TextStyle(
                                  fontSize: 14, color: hexToColor("#15a700")),
                            ),
                            Transform.scale(
                                scale:
                                    0.45, // Defina o fator de escala desejado
                                child: Transform.rotate(
                                  angle: 3.14159265,
                                  // Ângulo de rotação em radianos (180 graus)
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.grey,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.call_received,
                              size: 12,
                              color: Colors
                                  .green, // Defina o tamanho desejado aqui
                            ),
                            SizedBox(width: 10),
                            Text("R\$ 400.000,00",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: hexToColor("#6C757D"),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'bornamedium',
                                )),
                            Spacer(),
                            Text("Em assinatura",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: hexToColor("#002b31"),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'bornamedium',
                                )),
                          ],
                        ),
                      ]),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PrecData1(),
                          ),
                        );
                      },
                      child: Column(children: [
                        Row(
                          children: [
                            Text("04 abr 2023",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: hexToColor("#6C757D"),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'bornamedium',
                                )),
                            Spacer(),
                            Text(
                              "+R\$ 180.000,00",
                              style: TextStyle(
                                  fontSize: 14, color: hexToColor("#15a700")),
                            ),
                            Transform.scale(
                                scale:
                                    0.45, // Defina o fator de escala desejado
                                child: Transform.rotate(
                                  angle: 3.14159265,
                                  // Ângulo de rotação em radianos (180 graus)
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.grey,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.call_received,
                              size: 12,
                              color: Colors
                                  .green, // Defina o tamanho desejado aqui
                            ),
                            SizedBox(width: 10),
                            Text("R\$ 320.500,00",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: hexToColor("#6C757D"),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'bornamedium',
                                )),
                            Spacer(),
                            Text("Finalizado",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: hexToColor("#002b31"),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'bornamedium',
                                )),
                          ],
                        ),
                      ]),
                    ),
                    ColorChangingContainer()
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Vendas',
                style: TextStyle(
                    fontSize: 24,
                    color: hexToColor("#6C757D"),
                    fontWeight: FontWeight.w500),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PrecData1(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 50, top: 10),
                padding: EdgeInsets.all(20),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Valor do precatório",
                            style: TextStyle(
                              fontSize: 11,
                              color: hexToColor("#6C757D"),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'bornamedium',
                            ),
                          ),
                          Spacer(),
                          Text("Valor transação",
                              style: TextStyle(
                                fontSize: 11,
                                color: hexToColor("#6C757D"),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'bornamedium',
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("25 abr 2023",
                              style: TextStyle(
                                fontSize: 15,
                                color: hexToColor("#6C757D"),
                                fontWeight: FontWeight.w800,
                                fontFamily: 'bornamedium',
                              )),
                          Spacer(),
                          Text(
                            "-R\$ 276.000,00",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                          Transform.scale(
                              scale: 0.45, // Defina o fator de escala desejado
                              child: Transform.rotate(
                                angle: 3.14159265,
                                // Ângulo de rotação em radianos (180 graus)
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.grey,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                              scale: 1, // Defina o fator de escala desejado
                              child: Transform.rotate(
                                angle: 3.14159265,
                                // Ângulo de rotação em radianos (180 graus)
                                child: Icon(
                                  Icons.call_received,
                                  size: 12,
                                  color: Colors
                                      .red, // Defina o tamanho desejado aqui
                                ),
                              )),
                          SizedBox(width: 10),
                          Text("R\$ 210.000,00",
                              style: TextStyle(
                                fontSize: 11,
                                color: hexToColor("#6C757D"),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'bornamedium',
                              )),
                          Spacer(),
                          Text("Ativo",
                              style: TextStyle(
                                fontSize: 11,
                                color: hexToColor("#002b31"),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'bornamedium',
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: 136,
              decoration: BoxDecoration(
                  color: hexToColor("#ffdcd6"),
                  borderRadius: BorderRadius.circular(20)),
              child: Align(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.live_help,
                          size: 16,
                          color: hexToColor(
                              "#188754"), // Defina o tamanho desejado aqui
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Central de atendimento",
                          style: TextStyle(
                            fontSize: 16,
                            color: hexToColor("#6C757D"),
                            fontWeight: FontWeight.w800,
                            fontFamily: 'bornamedium',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Tel.: 0800 000 00000",
                        style: TextStyle(
                          fontSize: 15,
                          color: hexToColor("#6C757D"),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'bornamedium',
                        )),
                    SizedBox(height: 5),
                    Text("Chat: clique aqui (dias úteis - 8h às 18h)",
                        style: TextStyle(
                          fontSize: 15,
                          color: hexToColor("#6C757D"),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'bornamedium',
                        )),
                    SizedBox(height: 5),
                    Text("E-mail: contato@comprecatorios.com.br",
                        style: TextStyle(
                          fontSize: 15,
                          color: hexToColor("#6C757D"),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'bornamedium',
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      ///Container 2
      Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Lances',
              style: TextStyle(
                  fontSize: 24,
                  color: hexToColor("#6C757D"),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PrecData1(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(20),
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Valor do precatório",
                          style: TextStyle(
                            fontSize: 11,
                            color: hexToColor("#6C757D"),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'bornamedium',
                          ),
                        ),
                        Spacer(),
                        Text("Valor ofertado",
                            style: TextStyle(
                              fontSize: 11,
                              color: hexToColor("#6C757D"),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'bornamedium',
                            )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("25 abr 2023",
                            style: TextStyle(
                              fontSize: 15,
                              color: hexToColor("#6C757D"),
                              fontWeight: FontWeight.w800,
                              fontFamily: 'bornamedium',
                            )),
                        Spacer(),
                        Text(
                          "R\$ 50.000,00",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Transform.scale(
                            scale: 0.45, // Defina o fator de escala desejado
                            child: Transform.rotate(
                              angle: 3.14159265,
                              // Ângulo de rotação em radianos (180 graus)
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: hexToColor("#15a700"),
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          gavel,
                          size: 12, // Defina o tamanho desejado aqui
                        ),
                        SizedBox(width: 10),
                        Text("R\$ 210.000,00",
                            style: TextStyle(
                              fontSize: 11,
                              color: hexToColor("#6C757D"),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'bornamedium',
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.all(15),
            height: 136,
            decoration: BoxDecoration(
                color: hexToColor("#ffdcd6"),
                borderRadius: BorderRadius.circular(20)),
            child: Align(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.live_help,
                        size: 16,
                        color: hexToColor(
                            "#188754"), // Defina o tamanho desejado aqui
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Central de atendimento",
                        style: TextStyle(
                          fontSize: 16,
                          color: hexToColor("#6C757D"),
                          fontWeight: FontWeight.w800,
                          fontFamily: 'bornamedium',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Tel.: 0800 000 00000",
                      style: TextStyle(
                        fontSize: 15,
                        color: hexToColor("#6C757D"),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'bornamedium',
                      )),
                  SizedBox(height: 5),
                  Text("Chat: clique aqui (dias úteis - 8h às 18h)",
                      style: TextStyle(
                        fontSize: 15,
                        color: hexToColor("#6C757D"),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'bornamedium',
                      )),
                  SizedBox(height: 5),
                  Text("E-mail: contato@comprecatorios.com.br",
                      style: TextStyle(
                        fontSize: 15,
                        color: hexToColor("#6C757D"),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'bornamedium',
                      )),
                ],
              ),
            ),
          ),
        ],
      )),

      ///Container 3
      Container(
          width: double.infinity,
          height: 900,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Compras',
                  style: TextStyle(
                      fontSize: 24,
                      color: hexToColor("#6C757D"),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 50),
                padding: EdgeInsets.all(20),
                height: 295,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PrecData1(),
                            ),
                          );
                        },
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                "Valor do precatório",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: hexToColor("#6C757D"),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'bornamedium',
                                ),
                              ),
                              Spacer(),
                              Text("Valor da transação",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: hexToColor("#6C757D"),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'bornamedium',
                                  )),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("25 mai 2023",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: hexToColor("#6C757D"),
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'bornamedium',
                                  )),
                              Spacer(),
                              Text(
                                "+R\$ 85.800,00",
                                style: TextStyle(
                                    fontSize: 14, color: hexToColor("#15a700")),
                              ),
                              Transform.scale(
                                  scale:
                                      0.45, // Defina o fator de escala desejado
                                  child: Transform.rotate(
                                    angle: 3.14159265,
                                    // Ângulo de rotação em radianos (180 graus)
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.grey,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.call_received,
                                size: 12,
                                color: Colors
                                    .green, // Defina o tamanho desejado aqui
                              ),
                              SizedBox(width: 10),
                              Text("R\$ 145.500,00",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: hexToColor("#6C757D"),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'bornamedium',
                                  )),
                              Spacer(),
                              Text("Aguardando pagamento",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: hexToColor("#002b31"),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'bornamedium',
                                  )),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PrecData1(),
                            ),
                          );
                        },
                        child: Column(children: [
                          Row(
                            children: [
                              Text("15 abr 2023",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: hexToColor("#6C757D"),
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'bornamedium',
                                  )),
                              Spacer(),
                              Text(
                                "+R\$ 250.000,00",
                                style: TextStyle(
                                    fontSize: 14, color: hexToColor("#15a700")),
                              ),
                              Transform.scale(
                                  scale:
                                      0.45, // Defina o fator de escala desejado
                                  child: Transform.rotate(
                                    angle: 3.14159265,
                                    // Ângulo de rotação em radianos (180 graus)
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.grey,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.call_received,
                                size: 12,
                                color: Colors
                                    .green, // Defina o tamanho desejado aqui
                              ),
                              SizedBox(width: 10),
                              Text("R\$ 400.000,00",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: hexToColor("#6C757D"),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'bornamedium',
                                  )),
                              Spacer(),
                              Text("Em assinatura",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: hexToColor("#002b31"),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'bornamedium',
                                  )),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PrecData1(),
                            ),
                          );
                        },
                        child: Column(children: [
                          Row(
                            children: [
                              Text("04 abr 2023",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: hexToColor("#6C757D"),
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'bornamedium',
                                  )),
                              Spacer(),
                              Text(
                                "+R\$ 180.000,00",
                                style: TextStyle(
                                    fontSize: 14, color: hexToColor("#15a700")),
                              ),
                              Transform.scale(
                                  scale:
                                      0.45, // Defina o fator de escala desejado
                                  child: Transform.rotate(
                                    angle: 3.14159265,
                                    // Ângulo de rotação em radianos (180 graus)
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.grey,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.call_received,
                                size: 12,
                                color: Colors
                                    .green, // Defina o tamanho desejado aqui
                              ),
                              SizedBox(width: 10),
                              Text("R\$ 320.500,00",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: hexToColor("#6C757D"),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'bornamedium',
                                  )),
                              Spacer(),
                              Text("Finalizado",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: hexToColor("#002b31"),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'bornamedium',
                                  )),
                            ],
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(
                            top: 6, bottom: 6, left: 12, right: 12),
                        height: 38,
                        decoration: BoxDecoration(
                            color: hexToColor("#aeffa3"),
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.green,
                            ),
                            Text("Ver mais",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'bornamedium',
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 136,
                decoration: BoxDecoration(
                    color: hexToColor("#ffdcd6"),
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.live_help,
                            size: 16,
                            color: hexToColor(
                                "#188754"), // Defina o tamanho desejado aqui
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Central de atendimento",
                            style: TextStyle(
                              fontSize: 16,
                              color: hexToColor("#6C757D"),
                              fontWeight: FontWeight.w800,
                              fontFamily: 'bornamedium',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text("Tel.: 0800 000 00000",
                          style: TextStyle(
                            fontSize: 15,
                            color: hexToColor("#6C757D"),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'bornamedium',
                          )),
                      SizedBox(height: 5),
                      Text("Chat: clique aqui (dias úteis - 8h às 18h)",
                          style: TextStyle(
                            fontSize: 15,
                            color: hexToColor("#6C757D"),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'bornamedium',
                          )),
                      SizedBox(height: 5),
                      Text("E-mail: contato@comprecatorios.com.br",
                          style: TextStyle(
                            fontSize: 15,
                            color: hexToColor("#6C757D"),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'bornamedium',
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )),

      ///Container 4
      Container(
          width: double.infinity,
          height: 800,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Vendas',
                  style: TextStyle(
                      fontSize: 24,
                      color: hexToColor("#6C757D"),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50, top: 10),
                padding: EdgeInsets.all(20),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Valor do precatório",
                            style: TextStyle(
                              fontSize: 11,
                              color: hexToColor("#6C757D"),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'bornamedium',
                            ),
                          ),
                          Spacer(),
                          Text("Valor transação",
                              style: TextStyle(
                                fontSize: 11,
                                color: hexToColor("#6C757D"),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'bornamedium',
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("25 abr 2023",
                              style: TextStyle(
                                fontSize: 15,
                                color: hexToColor("#6C757D"),
                                fontWeight: FontWeight.w800,
                                fontFamily: 'bornamedium',
                              )),
                          Spacer(),
                          Text(
                            "-R\$ 276.000,00",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                          Transform.scale(
                              scale: 0.45, // Defina o fator de escala desejado
                              child: Transform.rotate(
                                angle: 3.14159265,
                                // Ângulo de rotação em radianos (180 graus)
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.grey,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                              scale: 1, // Defina o fator de escala desejado
                              child: Transform.rotate(
                                angle: 3.14159265,
                                // Ângulo de rotação em radianos (180 graus)
                                child: Icon(
                                  Icons.call_received,
                                  size: 12,
                                  color: Colors
                                      .red, // Defina o tamanho desejado aqui
                                ),
                              )),
                          SizedBox(width: 10),
                          Text("R\$ 210.000,00",
                              style: TextStyle(
                                fontSize: 11,
                                color: hexToColor("#6C757D"),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'bornamedium',
                              )),
                          Spacer(),
                          Text("Ativo",
                              style: TextStyle(
                                fontSize: 11,
                                color: hexToColor("#002b31"),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'bornamedium',
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 136,
                decoration: BoxDecoration(
                    color: hexToColor("#ffdcd6"),
                    borderRadius: BorderRadius.circular(20)),
                child: Align(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.live_help,
                            size: 16,
                            color: hexToColor(
                                "#188754"), // Defina o tamanho desejado aqui
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Central de atendimento",
                            style: TextStyle(
                              fontSize: 16,
                              color: hexToColor("#6C757D"),
                              fontWeight: FontWeight.w800,
                              fontFamily: 'bornamedium',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text("Tel.: 0800 000 00000",
                          style: TextStyle(
                            fontSize: 15,
                            color: hexToColor("#6C757D"),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'bornamedium',
                          )),
                      SizedBox(height: 5),
                      Text("Chat: clique aqui (dias úteis - 8h às 18h)",
                          style: TextStyle(
                            fontSize: 15,
                            color: hexToColor("#6C757D"),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'bornamedium',
                          )),
                      SizedBox(height: 5),
                      Text("E-mail: contato@comprecatorios.com.br",
                          style: TextStyle(
                            fontSize: 15,
                            color: hexToColor("#6C757D"),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'bornamedium',
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )),
    ];
  }

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 35),
      color: hexToColor("#F5F5F5"),
      child: Column(
        children: [
          // Aqui você pode adicionar os containers de conteúdo
          // Substitua os placeholders pelos seus conteúdos desejados
          Container(
            width: double.infinity, // Ocupa todo o espaço horizontal
            height: 40,
            margin: const EdgeInsets.only(left: 24, bottom: 8),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: current == index
                          ? hexToColor("#01292F")
                          : hexToColor("#d7d7d7"),
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: AnimatedContainer(
                      padding: current == index
                          ? EdgeInsets.only(left: 12, right: 10)
                          : EdgeInsets.symmetric(horizontal: 10),
                      duration: const Duration(milliseconds: 200),
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            width: current == index ? 30 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Center(
                                child: current == index ? IconCheck() : null),
                          ),
                          Text(
                            items[index],
                            style: TextStyle(
                              fontSize: 14,
                              color: current == index
                                  ? Colors.white
                                  : hexToColor("#212121"),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'bornamedium',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
            width: double.infinity,
            height: current == 0
                ? 980
                : current == 2
                    ? 650
                    : 450, //aqui estou definindo o height com base no item selecionado
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: containerList(context)[current],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorChangingContainer extends StatefulWidget {
  @override
  _ColorChangingContainerState createState() => _ColorChangingContainerState();
}

class _ColorChangingContainerState extends State<ColorChangingContainer> {
  bool isClicked = false;

  void _handleTap() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color containerColor = isClicked ? Colors.white : hexToColor("#AEFFA3");
    String buttonText = "Ver mais";

    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        height: 38,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(100),
          border: isClicked ? Border.all(width: 0.7) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 20,
              color: isClicked ? Colors.black : hexToColor("#12A701"),
            ),
            Text(
              buttonText,
              style: TextStyle(
                fontSize: 14,
                color: isClicked ? Colors.black : hexToColor("#12A701"),
                fontWeight: FontWeight.w400,
                fontFamily: 'bornamedium',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
