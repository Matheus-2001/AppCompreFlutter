import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';
import 'package:exemplo3/PaginasPrincipais/Login/Tela de Cadastro.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true; // Para controlar a visibilidade da senha
  bool _focado = false;
  bool _focado2 = false;
  bool _openForgotPassword = false;

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
        backgroundColor: Colors.red,
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
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Informe o Email para recuperação",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'bornamedium',
                fontSize: 15,
              ),
            ),
            Text(
              "da senha",
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: hexToColor("#012B31"),
            child: Column(children: [
              SizedBox(
                height: 60,
              ),
              if (_openForgotPassword)
                Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.red,
                  child: Center(
                    child: Text("voce recebere um email"),
                  ),
                ),
              Row(
                children: [
                  Image(
                      width: 160, // Defina a largura desejada
                      height: 60,
                      image: CachedNetworkImageProvider(
                        'https://comprecatorios.com.br/compre/assets/img/ComPre_logotipo-3.png', // Substitua pelo URL da sua imagem

                        maxWidth: 480,
                        maxHeight: 180,
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          width: 150, // Defina a largura desejada
                          height: 150,
                          image: CachedNetworkImageProvider(
                            'https://comprecatorios.com.br/compre/assets/img/ComPre_icone-5.png', // Substitua pelo URL da sua imagem
                            // Defina a altura desejada
                            maxWidth: 450,
                            maxHeight: 450,
                          )),
                      Container(
                          margin:
                              EdgeInsets.only(left: 30, right: 30, bottom: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  onTap: () {
                                    setState(() {
                                      _focado = true;
                                      _focado2 = false;
                                    });
                                  },
                                  style: TextStyle(
                                    color: Colors.white, // Cor do texto
                                    fontSize: 16, // Tamanho da fonte
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: _focado
                                        ? Colors.black.withOpacity(0.1)
                                        : Colors.black.withOpacity(0.001),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors
                                              .white), // Cor quando selecionado
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'Usuário*',
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  onTap: () {
                                    setState(() {
                                      _focado2 = true;
                                      _focado = false;
                                    });
                                  },
                                  style: TextStyle(
                                    color: Colors.white, // Cor do texto
                                    fontSize: 16, // Tamanho da fonte
                                  ),
                                  obscureText: _obscurePassword,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: _focado2
                                        ? Colors.black.withOpacity(0.1)
                                        : Colors.black.withOpacity(0.001),
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'Senha*',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10, top: 0),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          overlayColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.pressed)) {
                                                return Colors.black
                                                    .withOpacity(0.2);
                                              }
                                              return Colors.transparent;
                                            },
                                          ),
                                          elevation: MaterialStateProperty.all(
                                              0), // Remova a elevação
                                          backgroundColor: MaterialStateProperty
                                              .all<Color>(Colors
                                                  .transparent), // Cor de fundo do botão
                                        ),
                                        onPressed: () {
                                          _simulateFormSubmission();
                                        },
                                        child: Text(
                                          "Esqueci minha senha",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'bornamedium',
                                          ),
                                        )))
                              ])),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return MyScrollablePage();
                              },

                              /// função para criar transição na troca de página
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
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
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'bornamedium',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.black.withOpacity(0.2);
                              }
                              return Colors.transparent;
                            },
                          ),
                          elevation:
                              MaterialStateProperty.all(0), // Remova a elevação
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent), // Cor de fundo do botão
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return TabNavigator();
                              },

                              /// função para criar transição na troca de página
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                /// Begin = 0 para não ter animação de transição
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
                        child: Text(
                          "Novo por aqui? Cadastre-se!",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'bornamedium',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ]),
              ),
            ])));
  }
}
