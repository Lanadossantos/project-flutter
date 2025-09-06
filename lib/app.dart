import 'package:flutter/material.dart';
import 'package:project_flutter/pages.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

//Todo Widget precisa do metodo build
//Elementos da minha home, que é um StatefulWidget:
//Um componente de interface que pode ter seu estado mutável e atualizado dinamicamente ao longo do tempo.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //O atributo final declara uma variável que só pode ser inicializada uma vez
  final foto = const CircleAvatar(
    backgroundImage: NetworkImage(
      'https://avatars.githubusercontent.com/u/112086580?v=4',
    ),
    radius: 150,
  );

  final nome = const Text(
    'Alana Santos',
    style: TextStyle(fontSize: 30),
    textAlign: TextAlign.center,
  );

  final botaoTelefone = IconButton(
    color: Colors.pink,
    icon: const Icon(Icons.phone),
    onPressed: () {
      launchUrl(Uri(scheme: 'tel', path: '7198374-0526'));
    },
  );

  final botaoEmail = IconButton(
    color: Colors.pink,
    icon: const Icon(Icons.email),
    onPressed: () {
      launchUrl(Uri(scheme: 'mailto', path: 'adv.lanasantos@gmail.com'));
    },
  );

  final botaoGit = IconButton(
    color: Colors.pink,
    icon: Image.network(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Octicons-mark-github.svg/1200px-Octicons-mark-github.svg.png?20180806170715',
      width: 20,
      height: 20,
    ),
    onPressed: () {
      launchUrlString(
        'https://github.com/Lanadossantos',
        mode: LaunchMode.externalApplication,
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    //Scaffold é um contêiner para organizar componentes comuns de UI como:
    //AppBar (barra superior), Body (área principal de conteúdo),
    //FloatingActionButton (botão de ação flutuante)
    //BottomNavigationBar (barra de navegação inferior) e uma Drawer (gaveta).
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10, //Altura e intensidade da sombra
        shadowColor: Colors.black,//cor da sombra
        leading: Icon(Icons.menu, color: Colors.white, size: 35,),
        title: const Text('Meu Portifolio', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, )), 
        backgroundColor: Colors.pink, 
        actions: [
          IconButton(icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 35),
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Pages()),
            );
          },
          ),
        ],
        
        flexibleSpace: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors:[ Colors.blue, Colors.pink], begin: AlignmentGeometry.topLeft, end: AlignmentGeometry.bottomRight)),)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          foto,
          nome,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [botaoTelefone, botaoGit, botaoEmail],
          ),
        ],
      ),
    );
  }
}

