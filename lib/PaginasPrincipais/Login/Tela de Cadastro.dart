import 'package:flutter/material.dart';
import 'package:exemplo3/PaginasPrincipais/Login/Login.dart';
import 'package:cached_network_image/cached_network_image.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Page1(onNextPage: _nextPage),
      Page2(onNextPage: _nextPage),
      Page3(onNextPage: _nextPage),
      Page4(),
    ];
  }

  void _nextPage() {
    setState(() {
      if (_currentIndex < _pages.length - 1) {
        _currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 70, left: 40),
                  // Adiciona espaço à direita do ícone
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return Login();
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
                      size: 30,
                      color: Colors.grey,
                    ),
                  )),
              Container(
                width: 150,
                child: Image(
                    image: CachedNetworkImageProvider(
                  'https://comprecatorios.com.br/compre/assets/img/ComPre_logotipo-1.png',
                  maxWidth: 450,
                  maxHeight: 165,
                )),
              ),
            ],
          ),
          AnimatedSwitcher(
            duration:
                Duration(milliseconds: 500), // Define a duração da transição
            child: _pages[_currentIndex], // Página que está mudando
            switchInCurve: Curves.easeInOut, // Curva de entrada
            switchOutCurve: Curves.easeInOut, // Curva de saída
          ),
        ]),
      ),
      bottomNavigationBar: SizedBox(
        width: 100,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(color: Colors.transparent),
          unselectedLabelStyle: TextStyle(color: Colors.transparent),
          iconSize: 5,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          unselectedItemColor: Colors.red,
          selectedItemColor: Colors.red,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                width: 70,
                height: 2, // Altura da linha
                color: _currentIndex == 0
                    ? Colors.black
                    : Colors.black.withOpacity(0.3), // Cor da linha
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 70,
                height: 2, // Altura da linha
                color: _currentIndex == 1
                    ? Colors.black
                    : Colors.black.withOpacity(0.3), // Cor da linha
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 70,
                height: 2, // Altura da linha
                color: _currentIndex == 2
                    ? Colors.black
                    : Colors.black.withOpacity(0.3), // Cor da linha
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 70,
                height: 2, // Altura da linha
                color: _currentIndex == 3
                    ? Colors.black
                    : Colors.black.withOpacity(0.3), // Cor da linha
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

/// Página 1
class Page1 extends StatelessWidget {
  final VoidCallback onNextPage;

  Page1({required this.onNextPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      width: double.infinity,
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Container(
          height: 150,
          child: Image(
              image: CachedNetworkImageProvider(
            'https://comprecatorios.com.br/compre/assets/img/ComPre_elemento-2.png',
            maxWidth: 310,
            maxHeight: 450,
          )),
        ),
        SizedBox(
          height: 30,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Como funciona?",
              style: TextStyle(
                fontFamily: 'bornamedium',
                color: hexToColor("#002b31"),
                fontSize: 24,
              ),
            )),
        SizedBox(
          height: 30,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textAlign: TextAlign.justify,
              "Primeiro, realize o seu cadastro. Para tanto, basta informar o seu nome, e-mail e definir uma senha.",
              style: TextStyle(
                fontFamily: 'bornamedium',
                color: hexToColor("#002b31"),
                fontSize: 14,
              ),
            )),
        SizedBox(
          height: 50,
        ),
        GestureDetector(
            onTap: onNextPage,
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: hexToColor("#12A701"),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "Continuar",
                  style: TextStyle(
                      fontFamily: 'bornamedium',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )))),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
            onTap: () {
              for (int i = 0; i < 3; i++) {
                onNextPage();
              }
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "Pular",
                  style: TextStyle(
                      fontFamily: 'bornamedium',
                      color: hexToColor("#012B31"),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ))))
      ]),
    );
  }
}

/// Página 2
class Page2 extends StatelessWidget {
  final VoidCallback onNextPage;

  Page2({required this.onNextPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      width: double.infinity,
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Container(
          height: 150,
          child: Image(
              image: CachedNetworkImageProvider(
            'https://comprecatorios.com.br/compre/assets/img/ComPre_elemento-9.png',
            maxWidth: 599,
            maxHeight: 450,
          )),
        ),
        SizedBox(
          height: 30,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Navegue sem custos",
              style: TextStyle(
                fontFamily: 'bornamedium',
                color: hexToColor("#002b31"),
                fontSize: 24,
              ),
            )),
        SizedBox(
          height: 30,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textAlign: TextAlign.justify,
              "Com o login criado, você já pode navegar pelo aplicativo, comprar ou vender precatórios. Tudo muito simples e intuitivo. Não há mensalidade ou taxa de cadastro*. ",
              style: TextStyle(
                fontFamily: 'bornamedium',
                color: hexToColor("#002b31"),
                fontSize: 14,
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textAlign: TextAlign.justify,
              "* Taxas aplicáveis somente em negociações concluídas. ",
              style: TextStyle(
                fontFamily: 'bornamedium',
                color: hexToColor("#002b31"),
                fontSize: 12,
              ),
            )),
        SizedBox(
          height: 50,
        ),
        GestureDetector(
            onTap: onNextPage,
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: hexToColor("#12A701"),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "Continuar",
                  style: TextStyle(
                      fontFamily: 'bornamedium',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )))),
      ]),
    );
  }
}

/// Página 3
class Page3 extends StatelessWidget {
  final VoidCallback onNextPage;

  Page3({required this.onNextPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      width: double.infinity,
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Container(
          height: 150,
          child: Image(
              image: CachedNetworkImageProvider(
            'https://comprecatorios.com.br/compre/assets/img/ComPre_elemento-7.png',
            maxWidth: 438,
            maxHeight: 450,
          )),
        ),
        SizedBox(
          height: 30,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Conte conosco",
              style: TextStyle(
                fontFamily: 'bornamedium',
                color: hexToColor("#002b31"),
                fontSize: 24,
              ),
            )),
        SizedBox(
          height: 30,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textAlign: TextAlign.justify,
              "Conte com a nossa equipe de suporte a qualquer momento para auxiliá-lo ou orientá-lo. Pronto? Então vamos lá! ",
              style: TextStyle(
                fontFamily: 'bornamedium',
                color: hexToColor("#002b31"),
                fontSize: 14,
              ),
            )),
        SizedBox(
          height: 50,
        ),
        GestureDetector(
            onTap: onNextPage,
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: hexToColor("#12A701"),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "Continuar",
                  style: TextStyle(
                      fontFamily: 'bornamedium',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )))),
      ]),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            alignment: Alignment.centerLeft,
            child: Text(
              "Identifique-se",
              style: TextStyle(
                fontFamily: 'bornamedium',
                color: Colors.grey.shade600,
                fontSize: 24,
              ),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Nome',
              labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: Colors
                        .grey), // Cor da borda quando não está selecionado
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: hexToColor(
                        '#012B31')), // Cor da borda quando selecionado
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'E-mail',
              labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: Colors
                        .grey), // Cor da borda quando não está selecionado
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: hexToColor(
                        '#012B31')), // Cor da borda quando selecionado
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Senha',
              labelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: Colors
                        .grey), // Cor da borda quando não está selecionado
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: hexToColor(
                        '#012B31')), // Cor da borda quando selecionado
              ),
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Login();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
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
            child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: hexToColor("#12A701"),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  "Salvar",
                  style: TextStyle(
                      fontFamily: 'bornamedium',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )))),
      ],
    );
  }
}
