import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:exemplo3/Conteudos/AnimatedIconCheck/CheckGreen.dart';
import 'package:exemplo3/Conteudos/AnimatedIconCheck/CheckRed.dart';
import 'package:flutter/material.dart';
import 'package:exemplo3/Conteudos/AnimatedIconCheck/AnimatedCheck.dart';
import 'package:exemplo3/Conteudos/AnimatedIconCheck/CheckLightgreen.dart';
import 'package:exemplo3/Conteudos/AnimatedIconCheck/CheckYellow.dart';
import 'package:exemplo3/Conteudos/AnimatedIconCheck/CheckRed2.dart';
import 'package:exemplo3/PaginasPrincipais/paginaInvestir/DatePicker.dart';
import 'package:exemplo3/PaginasPrincipais/paginaInvestir/DatePicker2.dart';
import 'package:flutter/services.dart';

class FiltrosButtons extends StatefulWidget {
  @override
  _FiltrosButtonsState createState() => _FiltrosButtonsState();
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class _FiltrosButtonsState extends State<FiltrosButtons> {
  List<String> items = [
    "Curto prazo",
    "Médio prazo",
    "Longo prazo",
  ];

  List<String> items2 = [
    "Federal",
    "Municipal",
    "Estadual",
  ];

  List<String> items3 = [
    "Melhor oferta",
    "Valor fechado",
  ];

  int current = -1;
  int current2 = -1;
  int current3 = -1;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          width: double.infinity,
          child: Text(
            "Expectativa de pagamento:",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: hexToColor('#000000de'),
                fontSize: 14,
                fontFamily: 'bornamedium'),
          ),
        ),
      ]),

      ///Seletores 1 Expectativa de pagamento
      Container(
        width: double.infinity, // Ocupa todo o espaço horizontal
        height: 40,
        margin: const EdgeInsets.only(left: 0, bottom: 8, top: 0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (current == index) {
                    current =
                        -1; // Se o mesmo container for clicado novamente, defina como -1
                  } else {
                    current =
                        index; // Caso contrário, defina como o novo índice
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: (index == 0)
                      ? (current == index
                          ? hexToColor("#a5d19b")
                          : hexToColor("#B4E5A9"))
                      : (index == 1)
                          ? (current == index
                              ? hexToColor("#EAF0AE")
                              : hexToColor("#F4FAB4"))
                          : (index == 2)
                              ? (current == index
                                  ? hexToColor("#EEB3A7")
                                  : hexToColor("#F7B9AD"))
                              : hexToColor("#d7d7d7"),
                  borderRadius: BorderRadius.circular(200),
                ),
                child: AnimatedContainer(
                  padding: current == index
                      ? EdgeInsets.only(left: 12, right: 10)
                      : EdgeInsets.symmetric(horizontal: 10),
                  duration: const Duration(milliseconds: 70),
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        width: current == index ? 30 : 0,
                        duration: const Duration(milliseconds: 70),
                        child: Center(
                            child: current == index
                                ? current == 0
                                    ? IconCheckLightGreen()
                                    : current == 1
                                        ? IconCheckYellow()
                                        : IconCheckRed()
                                : null),
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
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          child: Text(
            "Tipo:",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: hexToColor('#000000de'),
                fontSize: 14,
                fontFamily: 'bornamedium'),
          ),
        ),
      ]),

      ///Seletores 2 Tipo
      Container(
        width: double.infinity, // Ocupa todo o espaço horizontal
        height: 40,
        margin: const EdgeInsets.only(left: 0, bottom: 8, top: 0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: items2.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (current2 == index) {
                    current2 =
                        -1; // Se o mesmo container for clicado novamente, defina como -1
                  } else {
                    current2 =
                        index; // Caso contrário, defina como o novo índice
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: (index == 0)
                      ? (current2 == index
                          ? hexToColor("#01292F")
                          : hexToColor("#d7d7d7"))
                      : (index == 1)
                          ? (current2 == index
                              ? hexToColor("#6A8D40")
                              : hexToColor("#d7d7d7"))
                          : (index == 2)
                              ? (current2 == index
                                  ? Colors.red
                                  : hexToColor("#d7d7d7"))
                              : hexToColor("#d7d7d7"),
                  borderRadius: BorderRadius.circular(200),
                ),
                child: AnimatedContainer(
                  padding: current2 == index
                      ? EdgeInsets.only(left: 12, right: 10)
                      : EdgeInsets.symmetric(horizontal: 10),
                  duration: const Duration(milliseconds: 70),
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        width: current2 == index ? 30 : 0,
                        duration: const Duration(milliseconds: 70),
                        child: Center(
                            child: current2 == index
                                ? current2 == 0
                                    ? IconCheck()
                                    : current2 == 1
                                        ? IconCheckGreen()
                                        : IconCheckRed2()
                                : null),
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
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          child: Text(
            "Formato:",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: hexToColor('#000000de'),
                fontSize: 14,
                fontFamily: 'bornamedium'),
          ),
        ),
      ]),

      ///Seletores 3 Formato
      Container(
        width: double.infinity, // Ocupa todo o espaço horizontal
        height: 40,
        margin: const EdgeInsets.only(left: 0, bottom: 8, top: 0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: items3.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (current3 == index) {
                    current3 =
                        -1; // Se o mesmo container for clicado novamente, defina como -1
                  } else {
                    current3 =
                        index; // Caso contrário, defina como o novo índice
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: (index == 0)
                      ? (current3 == index
                          ? hexToColor("#01292F")
                          : hexToColor("#d7d7d7"))
                      : (index == 1)
                          ? (current3 == index
                              ? hexToColor("#6A8D40")
                              : hexToColor("#d7d7d7"))
                          : (index == 2)
                              ? (current3 == index
                                  ? Colors.red
                                  : hexToColor("#d7d7d7"))
                              : hexToColor("#d7d7d7"),
                  borderRadius: BorderRadius.circular(200),
                ),
                child: AnimatedContainer(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  duration: const Duration(milliseconds: 70),
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        child: Center(
                          child: current3 == index
                              ? index == 0
                                  ? IconCheck()
                                  : IconCheckGreen() // Renderiza IconCheck() se a condição for verdadeira
                              : Icon(
                                  index == 0 ? Icons.sell : Icons.price_change,
                                  // Defina a cor e o tamanho do ícone conforme necessário
                                  // Cor do ícone quando selecionado
                                  size: 24, // Tamanho do ícone
                                ),
                        ),
                      ),
                      Text(
                        items3[index],
                        style: TextStyle(
                          fontSize: 14,
                          color: current3 == index
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
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          child: Text(
            "Valor:",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: hexToColor('#000000de'),
                fontSize: 14,
                fontFamily: 'bornamedium'),
          ),
        ),
      ]),
      Row(children: [
        Expanded(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  CurrencyTextInputFormatter(
                    locale: 'es',
                    decimalDigits: 2,
                    symbol: 'R\$ ',
                    customPattern: '\u00a4 #,###.#',
                  ),
                ],
                decoration: InputDecoration(
                  hintText: 'De',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  CurrencyTextInputFormatter(
                    locale: 'es',
                    decimalDigits: 2,
                    symbol: 'R\$ ',
                    customPattern: '\u00a4 #,###.#',
                  ),
                ],
                decoration: InputDecoration(
                  hintText: 'Até',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        child: Text(
          "Data:",
          textAlign: TextAlign.left,
          style: TextStyle(
              color: hexToColor('#000000de'),
              fontSize: 14,
              fontFamily: 'bornamedium'),
        ),
      ),
      Row(children: [
        Expanded(
          child: DatePickerExample(),
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: DatePickerExample2(),
        ),
      ]),
      SizedBox(
        height: 20,
      ),
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(hexToColor("#01282E")),
        ), // Cor de fundo desejada
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Aplicar",
          style: TextStyle(fontSize: 16, fontFamily: 'bornamedium'),
        ),
      )
    ]);
  }
}
