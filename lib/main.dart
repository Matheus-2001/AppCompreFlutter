// ignore_for_file: unused_import

import 'package:exemplo3/PaginasPrincipais/Login/Login.dart';
import 'package:exemplo3/PaginasPrincipais/paginaInvestir/paginaInvestir.dart';
import 'package:exemplo3/PaginasPrincipais/paginaVender/paginaVender.dart';
import 'package:exemplo3/PaginasPrincipais/paginaHome/paginaHome.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:exemplo3/Conteudos/ConteudosContainerPrec.dart'; // Substitua "sua_app" pelo caminho correto para o arquivo.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = true;
    return MaterialApp(
      home: Login(),
    );
  }
}
