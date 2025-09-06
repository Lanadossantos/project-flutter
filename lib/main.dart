import 'package:flutter/material.dart';
import 'package:project_flutter/app.dart';
//import 'package:project_flutter/pages.dart';

// Função de start da minha aplicação
void main() {
  runApp(const MyApp());
}

//Chama a minha home
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //defini como meu widget vai aparecer na tela
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
