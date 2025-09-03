import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//Elementos da minha home, que é um StatefulWidget:
//Um componente de interface que pode ter seu estado mutável e atualizado dinamicamente ao longo do tempo.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

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
