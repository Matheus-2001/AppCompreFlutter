import 'package:flutter/material.dart';
import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';
import 'package:flutter/services.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class VenderTab extends StatefulWidget {
  @override
  _VenderTabState createState() => _VenderTabState();
}

class _VenderTabState extends State<VenderTab> {
  bool isContainerVisible = true;
  bool isContainerVisible2 = true;

  void toggleContainerVisibility() {
    if (current3 == 0)
      setState(() {
        isContainerVisible = !isContainerVisible;
      });
    if (current3 == 1)
      setState(() {
        isContainerVisible2 = !isContainerVisible2;
      });
  }

  TextEditingController _numberController = TextEditingController();
  bool _showInfo = false;

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  bool _isBoxVisible = false;
  bool _isBoxVisible2 = false;
  bool menu3Able = false;
  bool menu4Able = false;

  ScrollController scrollController = ScrollController();

  void _toggleBoxVisibility() {
    setState(() {
      _isBoxVisible = !_isBoxVisible;
    });
  }

  void _toggleBoxVisibility2() {
    setState(() {
      _isBoxVisible2 = !_isBoxVisible2;
    });
  }

  void _toggleMenu3Able() {
    setState(() {
      menu3Able = !menu3Able;
    });
  }

  void _toggleMenu4Able() {
    setState(() {
      menu4Able = !menu4Able;
    });
  }

  @override
  void initState() {
    scrollController.addListener(() {
      //scroll listener
    });
    super.initState();
  }

  void _simulateFormSubmission() {
    // Exibir uma mensagem na tela
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior:
            SnackBarBehavior.floating, // Define o comportamento como flutuante
        margin:
            EdgeInsets.only(bottom: 710), // Ajuste a margem conforme necessário
        showCloseIcon: true,
        closeIconColor: Colors.white,
        backgroundColor: hexToColor("#16A112"),
        content: Row(children: [
          Column(children: [
            Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons.task_alt,
                  size: 25,
                  color: Colors.white,
                ))
          ]),
          Column(children: [
            Text(
              "Precatório enviado com sucesso!",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'bornamedium',
                fontSize: 15,
              ),
            ),
            Text(
              "Aguarde um retorno por e-mail.",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'bornamedium',
                fontSize: 15,
              ),
            ),
          ]),
        ]),
      ),
    );

    // Navegar para a página inicial após um pequeno atraso
    Future.delayed(Duration(seconds: 0), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyScrollablePage(),
        ),
      );
    });
  }

  bool successText = true;
  void _toggleSuccessText() {
    setState(() {
      successText = !successText;
    });
  }

  List<String> items2 = [
    "Sim",
    "Não",
    "Não sei",
  ];

  List<Container> containerList2 = [
    Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Qual o valor do PSS?",
              style: TextStyle(
                color: hexToColor('#6c757d'),
                fontFamily: 'bornamedium',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              CurrencyTextInputFormatter(
                  locale: 'es',
                  decimalDigits: 2,
                  symbol: 'R\$ ',
                  customPattern: '\u00a4 #,###.#'),
            ],
            decoration: InputDecoration(
              hintText: 'Ex.: R\$30.000,00',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: Colors
                        .grey), // Cor da borda quando não está selecionado
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: Colors.black), // Cor da borda quando selecionado
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      height: 00,
    ),
    Container(
      width: double.infinity,
      height: 0,
    )
  ];

  /// scroll menu 3
  List<String> items3 = [
    "Valor fechado",
    "Melhor oferta",
  ];

  List<Container> containerList3 = [
    Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Qual o valor desejado para a venda?",
              style: TextStyle(
                color: hexToColor('#6c757d'),
                fontFamily: 'bornamedium',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              CurrencyTextInputFormatter(
                  locale: 'es',
                  decimalDigits: 2,
                  symbol: 'R\$ ',
                  customPattern: '\u00a4 #,###.#'),
            ],
            decoration: InputDecoration(
              hintText: 'Ex.: R\$30.000,00',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: Colors
                        .grey), // Cor da borda quando não está selecionado
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: Colors.black), // Cor da borda quando selecionado
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Qual o valor MÍNIMO desejado para a venda?",
              style: TextStyle(
                color: hexToColor('#6c757d'),
                fontFamily: 'bornamedium',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SliderExample(),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  "Por quanto tempo ficará disponível?",
                  style: TextStyle(
                    color: hexToColor('#6c757d'),
                    fontFamily: 'bornamedium',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          DropdownTextFieldExample(),
        ],
      ),
    ),
  ];

  List<String> items4 = [
    "Federal",
    "Estadual",
    "Municipal",
  ];

  List<Container> containerList4 = [
    Container(
      height: 0,
    ),
    Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Qual o ente devedor?",
                style: TextStyle(
                  color: hexToColor('#6c757d'),
                  fontFamily: 'bornamedium',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            DropdownTextFieldExample4(),
          ],
        )),
    Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Qual o ente devedor?",
                style: TextStyle(
                  color: hexToColor('#6c757d'),
                  fontFamily: 'bornamedium',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            DropdownTextFieldExample4(),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: DropdownTextFieldExample5(),
            )
          ],
        )),
  ];

  int current2 = 1;
  int current3 = -1;
  int current4 = -1;
  bool isContainerVisible3 = false;

  void toggleContainerVisibility3() {
    setState(() {
      isContainerVisible3 = !isContainerVisible3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: hexToColor('#F5F5F5'),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 60, bottom: 50),
            height: _showInfo
                ? menu3Able
                    ? null
                    : 950
                : 950,
            width: MediaQuery.of(context).size.width,

            ///coluna principal
            child: Stack(children: [
              Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 100, left: 40),
                            // Adiciona espaço à direita do ícone
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return MyScrollablePage();
                                    },
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(0, -1);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;
                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
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
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 30,
                                color: Colors.grey,
                              ),
                            )),
                        Text(
                          "Vender",
                          style: TextStyle(
                              color: hexToColor('#6c757d'),
                              fontSize: 28,
                              fontFamily: 'bornamedium'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40, left: 25),
                    child: Row(
                      children: [
                        Text(
                          "Qual o valor do seu precatório?",
                          style: TextStyle(
                            color: hexToColor('#6c757d'),
                            fontFamily: 'bornamedium',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggleBoxVisibility,
                          child: Icon(
                            Icons.help_outline,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 25, left: 25, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: _numberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                CurrencyTextInputFormatter(
                                    locale: 'es',
                                    decimalDigits: 2,
                                    symbol: 'R\$ ',
                                    customPattern: '\u00a4 #,###.#'),
                              ],
                              decoration: InputDecoration(
                                hintText: 'Ex.: R\$300.000,00',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                  borderSide: BorderSide(
                                      color: Colors
                                          .grey), // Cor da borda quando não está selecionado
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors
                                          .black), // Cor da borda quando selecionado
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    _showInfo = true;
                                  });
                                } else {
                                  setState(() {
                                    _showInfo = false;
                                  });
                                }
                              },
                            ),
                            Visibility(
                              visible: _showInfo,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 25, left: 15, right: 15),
                                    margin: EdgeInsets.only(top: 20),
                                    width: double.infinity,
                                    height: 144,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: hexToColor('#ffdcd6')),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.tips_and_updates,
                                              color: hexToColor('#f98469'),
                                              size: 40,
                                            ),
                                            // Ícone no canto superior esquerdo
                                            SizedBox(width: 8),
                                            // Espaçamento entre o ícone e o texto
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Lembre-se que o  comprador  deverá pagar ',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: hexToColor(
                                                                "#6c757d"),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'o imposto  de renda,  quando  da  liquidação',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: hexToColor(
                                                            "#6c757d"),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        RichText(
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: hexToColor("#6c757d"),
                                                fontWeight: FontWeight.w600),
                                            children: [
                                              TextSpan(
                                                text:
                                                    'do título. A alíquota é de 3% e, com base no valor do precatório informado, o imposto será de, aproximadamente',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///infobox flutuante do icon interrogação
                      if (_isBoxVisible)
                        Positioned(
                          top: 10,
                          left: 180,
                          // Adjst this value to control the position
                          child: Container(
                            width: 200,
                            height: 40,
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: hexToColor('#616161'),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Informe o valor do principal, acrescido dos juros',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'bornamedium',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (_showInfo)
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 25),
                      child: Row(
                        children: [
                          Text(
                            "O seu precatório possui PSS?",
                            style: TextStyle(
                              color: hexToColor('#6c757d'),
                              fontFamily: 'bornamedium',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: _toggleBoxVisibility2,
                            child: Icon(
                              Icons.help_outline,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (_showInfo)
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          // Ocupa todo o espaço horizontal
                          height: 40,
                          margin: const EdgeInsets.only(left: 20, bottom: 8),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: items2.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current2 = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: (index == 0)
                                        ? (current2 == index
                                            ? hexToColor("#01292F")
                                            : hexToColor("#d7d7d7"))
                                        : (index == 1)
                                            ? (current2 == index
                                                ? hexToColor("#698D40")
                                                : hexToColor("#d7d7d7"))
                                            : (index == 2)
                                                ? (current2 == index
                                                    ? Colors.red
                                                    : hexToColor("#d7d7d7"))
                                                : hexToColor("#d7d7d7"),
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 150),
                                    height: 35,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Visibility(
                                          visible: current2 == index,
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 150),
                                            child: Icon(Icons.check,
                                                color: Colors.white, size: 23),
                                          ),
                                        ),
                                        AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 150),
                                          width: current2 == index ? 15 : 0,
                                        ),
                                        Text(
                                          items2[index],
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: current2 == index
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
                        if (_isBoxVisible2)
                          Positioned(
                            top: 5,
                            left: 180,
                            // Adjst this value to control the position
                            child: Container(
                              width: 200,
                              height: 40,
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                color: hexToColor('#616161'),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'PSS é o valor referente ao Programa de Seguridade Social',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'bornamedium',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),

                        ///Final if(_showinfo)
                      ],
                    ),
                  if (_showInfo)
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      width: double.infinity,
                      height: current2 == 0 ? 120 : 0,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: containerList2[current2],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ///Final if(_showinfo)
                  if (_showInfo)
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20, bottom: 15),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Qual o formato da negociação você gostaria?",
                              style: TextStyle(
                                color: hexToColor('#6c757d'),
                                fontFamily: 'bornamedium',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ///Final if(_showinfo)
                  if (_showInfo)
                    Container(
                      width: double.infinity,
                      // Ocupa todo o espaço horizontal
                      height: 40,
                      margin: const EdgeInsets.only(left: 20, bottom: 8),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: items3.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index3) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                current3 = index3;
                                menu3Able = true;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: (index3 == 0)
                                    ? (current3 == index3
                                        ? hexToColor("#698D40")
                                        : hexToColor("#d7d7d7"))
                                    : (index3 == 1)
                                        ? (current3 == index3
                                            ? Colors.red
                                            : hexToColor("#d7d7d7"))
                                        : (index3 == -1)
                                            ? hexToColor("#d7d7d7")
                                            : hexToColor("#d7d7d7"),
                                borderRadius: BorderRadius.circular(200),
                              ),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                height: 35,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Visibility(
                                      visible: current3 == index3,
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 150),
                                        child: Icon(Icons.check,
                                            color: Colors.white, size: 23),
                                      ),
                                    ),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 150),
                                      width: current3 == index3 ? 15 : 0,
                                    ),
                                    Text(
                                      items3[index3],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: current3 == index3
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
                  if (menu3Able && current3 == 0)
                    if (_showInfo)
                      AnimatedOpacity(
                        opacity: isContainerVisible
                            ? 1.0
                            : 0.0, // Defina a opacidade com base na visibilidade
                        duration: Duration(
                            milliseconds: 300), // Defina a duração da animação
                        curve: Curves
                            .easeInOut, // Escolha uma curva de animação suave
                        child: Container(
                          margin: const EdgeInsets.only(right: 20, left: 20),
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          height: isContainerVisible ? 270 : 0,
                          decoration: BoxDecoration(
                              color: hexToColor('#012B31'),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: hexToColor("#AEFFA3"),
                                    size: 36,
                                  ),
                                  // Ícone no canto superior esquerdo
                                  SizedBox(width: 8),
                                  // Espaçamento entre o ícone e o texto
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'No formato ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'bornamedium',
                                              ),
                                            ),
                                            RichText(
                                              textAlign: TextAlign.justify,
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: ' VALOR  FECHADO  ',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontFamily: 'bornamedium',
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'você deve',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'bornamedium',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'definir  um  valor  fixo para a venda do  seu',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'bornamedium',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'bornamedium',
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          'título. Nesse caso, caso haja interesse na compra do seu precatório, o comprador deverá pagar o valor estipulado por você, acrescido das taxas aplicáveis. ',
                                    ),
                                    TextSpan(
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                      text:
                                          '\nLembre-se: o valor fixo para venda nunca deve ser igual ao valor do precatório. Quanto maior o deságio, maior a chance de venda e rapidez na negociação',
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: toggleContainerVisibility,
                                    child: Text(
                                      'Entendi!',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  if (menu3Able && current3 == 1)
                    if (_showInfo)
                      AnimatedOpacity(
                        opacity: isContainerVisible2
                            ? 1.0
                            : 0.0, // Defina a opacidade com base na visibilidade
                        duration: Duration(
                            milliseconds: 300), // Defina a duração da animação
                        curve: Curves
                            .easeInOut, // Escolha uma curva de animação suave
                        child: Container(
                          margin: EdgeInsets.only(right: 20, left: 20),
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          height: isContainerVisible2 ? 230 : 0,
                          decoration: BoxDecoration(
                              color: hexToColor('#012B31'),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: hexToColor("#AEFFA3"),
                                    size: 36,
                                  ),
                                  // Ícone no canto superior esquerdo
                                  SizedBox(width: 8),
                                  // Espaçamento entre o ícone e o texto
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'No   formato ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'bornamedium',
                                              ),
                                            ),
                                            RichText(
                                              textAlign: TextAlign.justify,
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        '   MELHOR   OFERTA   ',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontFamily: 'bornamedium',
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' você',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'bornamedium',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'define  um  valor  mínimo aceitável e um ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'bornamedium',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'bornamedium',
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          'Prazo para recebimento das ofertas. Ao final do prazo, caso haja alguma oferta igual ou superior ao mínimo estabelecido, a negociação prosseguirá com o pagamento do valor negociado, acrescido das taxas aplicáveis.',
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: toggleContainerVisibility,
                                    child: Text(
                                      'Entendi!',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  if (menu3Able)
                    if (_showInfo)
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
                        width: double.infinity,
                        height: current3 == 1 ? 300 : 100,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: containerList3[current3],
                              ),
                            ),
                          ],
                        ),
                      ),
                  if (menu3Able)
                    if (_showInfo)
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 25, bottom: 10),
                              child: Text(
                                "O seu precatório é de qual tipo?",
                                style: TextStyle(
                                  color: hexToColor('#6c757d'),
                                  fontFamily: 'bornamedium',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              // Ocupa todo o espaço horizontal
                              height: 40,
                              margin:
                                  const EdgeInsets.only(left: 20, bottom: 8),
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: items4.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index4) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current4 = index4;
                                        menu4Able = true;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: (index4 == 0)
                                            ? (current4 == index4
                                                ? hexToColor("#01292F")
                                                : hexToColor("#d7d7d7"))
                                            : (index4 == 1)
                                                ? (current4 == index4
                                                    ? hexToColor("#698D40")
                                                    : hexToColor("#d7d7d7"))
                                                : (index4 == 2)
                                                    ? (current4 == index4
                                                        ? Colors.red
                                                        : hexToColor("#d7d7d7"))
                                                    : hexToColor("#d7d7d7"),
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 150),
                                        height: 35,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Visibility(
                                              visible: current4 == index4,
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 150),
                                                child: Icon(Icons.check,
                                                    color: Colors.white,
                                                    size: 23),
                                              ),
                                            ),
                                            AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 150),
                                              width:
                                                  current4 == index4 ? 15 : 0,
                                            ),
                                            Text(
                                              items4[index4],
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: current4 == index4
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
                          ]),
                  if (menu4Able)
                    if (_showInfo)
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
                        width: double.infinity,
                        height: current4 == 0
                            ? 0
                            : current4 == 1
                                ? 120
                                : 210,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: containerList4[current4],
                              ),
                            ),
                          ],
                        ),
                      ),
                  if (menu3Able)
                    if (_showInfo)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                bottom: 10, left: 20, top: menu4Able ? 0 : 20),
                            child: Text(
                              "Qual a natureza?",
                              style: TextStyle(
                                color: hexToColor('#6c757d'),
                                fontFamily: 'bornamedium',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: DropdownTextFieldExample6(),
                          ),
                        ],
                      ),
                  if (menu3Able)
                    if (_showInfo)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 30),
                        margin: EdgeInsets.only(right: 10, left: 10, top: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: hexToColor("#002b31"),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'bornamedium',
                                  ),
                                  children: [
                                    WidgetSpan(
                                        child: Container(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Icon(
                                              Icons.live_help,
                                              size: 17,
                                              color: Colors.green.shade800,
                                            ))),
                                    TextSpan(
                                      text:
                                          ' As informações a seguir são de caráter ',
                                    ),
                                    TextSpan(
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                      text: 'sigiloso',
                                    ),
                                    TextSpan(
                                      text:
                                          ' e servirão somente para a avaliação por parte da equipe ComPre',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  bottom: 10, left: 20, top: 20),
                              child: Text(
                                "Qual é o CPF do titular?",
                                style: TextStyle(
                                  color: hexToColor('#6c757d'),
                                  fontFamily: 'bornamedium',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey), // Cor da borda quando não está selecionado
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: hexToColor(
                                            '#012B31')), // Cor da borda quando selecionado
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  bottom: 10, left: 20, top: 20),
                              child: Text(
                                "Qual o número do processo?",
                                style: TextStyle(
                                  color: hexToColor('#6c757d'),
                                  fontFamily: 'bornamedium',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey), // Cor da borda quando não está selecionado
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                        color: hexToColor(
                                            '#012B31')), // Cor da borda quando selecionado
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  bottom: 10, left: 20, top: 20),
                              child: Text(
                                "Qual o número do precatório?",
                                style: TextStyle(
                                  color: hexToColor('#6c757d'),
                                  fontFamily: 'bornamedium',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Opcional',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3.0),
                                      borderSide: BorderSide(
                                          color: Colors
                                              .grey), // Cor da borda quando não está selecionado
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: hexToColor(
                                              '#012B31')), // Cor da borda quando selecionado
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                  if (menu3Able)
                    if (_showInfo)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                            child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  height: 350,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 5, right: 10, left: 10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey.shade300,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Row(children: [
                                            Text(
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.grey.shade500,
                                                  fontWeight: FontWeight.w700),
                                              "Confirmação",
                                            ),
                                            Spacer(),
                                            IconButton(
                                              icon: Icon(Icons
                                                  .close), // Ícone que deseja exibir
                                              onPressed: () {
                                                Navigator.pop(
                                                    context); // Ação que deseja executar quando o ícone for pressionado
                                              },
                                            )
                                          ]),
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(20),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    textAlign:
                                                        TextAlign.justify,
                                                    "A partir desse momento o seu precatório será analisado, revisado e complementado pela equipe ComPre. Caso esteja tudo certo, o seu anúncio será disponibilizado. Todas as movimentações serão comunicadas por e-mail, mas você também pode acompanhar o status pelo aplicativo. ",
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    "Tem certeza que deseja continuar?",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  )
                                                ])),
                                        Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(
                                              right: 20, left: 20),
                                          padding: EdgeInsets.only(
                                              top: 5, right: 10, left: 10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Colors.grey.shade300,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty.all<
                                                                  Color>(
                                                              hexToColor(
                                                                  "#6e9343")), // Cor de fundo
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      "Não",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                TextButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty.all<
                                                                  Color>(
                                                              hexToColor(
                                                                  "#002b31")), // Cor de fundo
                                                    ),
                                                    onPressed:
                                                        _simulateFormSubmission,
                                                    child: Text(
                                                      "Sim",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ]),
                                        ),
                                      ]),
                                );
                              },
                            );
                            // Coloque aquonPressed: toggleContainerVisibility,i o código que você deseja executar quando o botão é pressionado.
                          },
                          style: ElevatedButton.styleFrom(
                            primary: hexToColor(
                                '#002b31'), // Define a cor de fundo do botão como verde.
                            fixedSize: Size(120,
                                35), // Define a largura e altura mínimas do botão.
                            alignment: Alignment
                                .center, // Alinha o conteúdo do botão ao centro.
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Centraliza o ícone e o texto na horizontal.
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.send),
                              ), // Ícone do botão.
                              Text("Enviar"), // Texto do botão.
                            ],
                          ),
                        )),
                      ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 20;
  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textFieldController.text = _currentSliderValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 0),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: hexToColor('#012B31'),
                // Cor da parte ativa do slider
                inactiveTrackColor: Colors.grey,
                // Cor da parte inativa do slider
                thumbColor: hexToColor('#012B31'),
                // Cor do indicador (ponteiro)
                overlayColor: hexToColor('#012B31').withOpacity(0.3),
                // Cor da sobreposição ao pressionar
                valueIndicatorColor: Colors.black.withOpacity(0.5),
                // Cor do indicador de valor
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white, // Cor do texto do indicador de valor
                ),
              ),
              child: Slider(
                value: _currentSliderValue,
                min: 0.0,
                max: 100.0,
                divisions: 1,
                label: 'R\$${_currentSliderValue.round().toString()}',
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    _textFieldController.text = value.toStringAsFixed(1);
                  });
                },
              ),
            ),
          ),
          Container(
            child: TextField(
              inputFormatters: <TextInputFormatter>[
                CurrencyTextInputFormatter(
                    locale: 'es',
                    decimalDigits: 2,
                    symbol: 'R\$ ',
                    customPattern: '\u00a4 #,###.#'),
              ],
              decoration: InputDecoration(
                hintText: 'Ex.: R\$30.000,00',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0),
                  borderSide: BorderSide(
                      color: Colors
                          .grey), // Cor da borda quando não está selecionado
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: hexToColor(
                          '#012B31')), // Cor da borda quando selecionado
                ),
              ),
              controller: _textFieldController,
              onChanged: (String value) {
                setState(() {
                  try {
                    _currentSliderValue = double.parse(value);
                  } catch (e) {
                    // Handle invalid input gracefully
                  }
                });
              },
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownTextFieldExample extends StatefulWidget {
  @override
  _DropdownTextFieldExampleState createState() =>
      _DropdownTextFieldExampleState();
}

class _DropdownTextFieldExampleState extends State<DropdownTextFieldExample> {
  String? selectedOption = 'Option 3';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            hint: Text('Selecione'),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: Colors
                        .grey), // Cor da borda quando não está selecionado
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: hexToColor(
                        '#012B31')), // Cor da borda quando não está selecionado
              ),
            ),
            value: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
            },
            items: [
              DropdownMenuItem(
                value: 'Option 1',
                child: Text('5 dias'),
              ),
              DropdownMenuItem(
                value: 'Option 2',
                child: Text('10 dias'),
              ),
              DropdownMenuItem(
                value: 'Option 3',
                child: Text('15 dias'),
              ),
              DropdownMenuItem(
                value: 'Option 4',
                child: Text('30 dias'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DropdownTextFieldExample4 extends StatefulWidget {
  @override
  _DropdownTextFieldExampleState4 createState() =>
      _DropdownTextFieldExampleState4();
}

class _DropdownTextFieldExampleState4 extends State<DropdownTextFieldExample4> {
  String? selectedOption4;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      width: double.infinity,
      child: Column(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              menuMaxHeight: 315,
              hint: Text('Estado'),
              elevation: 8,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.0),
                  borderSide: BorderSide(
                      color: Colors
                          .grey), // Cor da borda quando não está selecionado
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: hexToColor(
                          '#012B31')), // Cor da borda quando não está selecionado
                ),
              ),
              value: selectedOption4,
              onChanged: (value) {
                setState(() {
                  selectedOption4 = value;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'AC',
                  child: Text('Acre'),
                ),
                DropdownMenuItem(
                  value: 'AL',
                  child: Text('Alagoas'),
                ),
                DropdownMenuItem(
                  value: 'AP',
                  child: Text('Amapá'),
                ),
                DropdownMenuItem(
                  value: 'AM',
                  child: Text('Amazonas'),
                ),
                DropdownMenuItem(
                  value: 'BA',
                  child: Text('Bahia'),
                ),
                DropdownMenuItem(
                  value: 'CE',
                  child: Text('Ceará'),
                ),
                DropdownMenuItem(
                  value: 'DF',
                  child: Text('Distrito Federal'),
                ),
                DropdownMenuItem(
                  value: 'ES',
                  child: Text('Espírito Santo'),
                ),
                DropdownMenuItem(
                  value: 'GO',
                  child: Text('Goiás'),
                ),
                DropdownMenuItem(
                  value: 'MA',
                  child: Text('Maranhão'),
                ),
                DropdownMenuItem(
                  value: 'MT',
                  child: Text('Mato Grosso'),
                ),
                DropdownMenuItem(
                  value: 'MS',
                  child: Text('Mato Grosso do Sul'),
                ),
                DropdownMenuItem(
                  value: 'MG',
                  child: Text('Minas Gerais'),
                ),
                DropdownMenuItem(
                  value: 'PA',
                  child: Text('Pará'),
                ),
                DropdownMenuItem(
                  value: 'PB',
                  child: Text('Paraíba'),
                ),
                DropdownMenuItem(
                  value: 'PR',
                  child: Text('Paraná'),
                ),
                DropdownMenuItem(
                  value: 'PE',
                  child: Text('Pernambuco'),
                ),
                DropdownMenuItem(
                  value: 'PI',
                  child: Text('Piauí'),
                ),
                DropdownMenuItem(
                  value: 'RJ',
                  child: Text('Rio de Janeiro'),
                ),
                DropdownMenuItem(
                  value: 'RN',
                  child: Text('Rio Grande do Norte'),
                ),
                DropdownMenuItem(
                  value: 'RS',
                  child: Text('Rio Grande do Sul'),
                ),
                DropdownMenuItem(
                  value: 'RO',
                  child: Text('Rondônia'),
                ),
                DropdownMenuItem(
                  value: 'RR',
                  child: Text('Roraima'),
                ),
                DropdownMenuItem(
                  value: 'SC',
                  child: Text('Santa Catarina'),
                ),
                DropdownMenuItem(
                  value: 'SP',
                  child: Text('São Paulo'),
                ),
                DropdownMenuItem(
                  value: 'SE',
                  child: Text('Sergipe'),
                ),
                DropdownMenuItem(
                  value: 'TO',
                  child: Text('Tocantins'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownTextFieldExample5 extends StatefulWidget {
  @override
  _DropdownTextFieldExampleState5 createState() =>
      _DropdownTextFieldExampleState5();
}

class _DropdownTextFieldExampleState5 extends State<DropdownTextFieldExample5> {
  String? selectedOption5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            hint: Text('Município'),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: Colors
                        .grey), // Cor da borda quando não está selecionado
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: hexToColor(
                        '#012B31')), // Cor da borda quando não está selecionado
              ),
            ),
            value: selectedOption5,
            onChanged: (value) {
              setState(() {
                selectedOption5 = value;
              });
            },
            items: [
              DropdownMenuItem(
                value: 'Option 1',
                child: Text('Brasília'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DropdownTextFieldExample6 extends StatefulWidget {
  @override
  _DropdownTextFieldExampleState6 createState() =>
      _DropdownTextFieldExampleState6();
}

class _DropdownTextFieldExampleState6 extends State<DropdownTextFieldExample6> {
  String? selectedOption6;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            hint: Text('Selecione'),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                    color: Colors
                        .grey), // Cor da borda quando não está selecionado
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: hexToColor(
                        '#012B31')), // Cor da borda quando não está selecionado
              ),
            ),
            value: selectedOption6,
            onChanged: (value) {
              setState(() {
                selectedOption6 = value;
              });
            },
            items: [
              DropdownMenuItem(
                value: 'Option 1',
                child: Text('Alimentar'),
              ),
              DropdownMenuItem(
                value: 'Option 2',
                child: Text('Comum'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
