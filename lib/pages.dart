import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_flutter/app.dart';
import 'package:url_launcher/url_launcher.dart';

class Pages extends StatelessWidget{
  const Pages({super.key});

  /*Metodos para gerar a minha pageView
    1- launcher solicita recursos externo, rotas de paginas, etc
    2- pageViewModel esqueleto das minha telas
    Obs: _ <- torna o metodo privado, só posso acessa-lo nesta classe
  */
  void _launcherURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // força abrir no navegador
    )) {
      throw 'Não foi possível abrir $url';
    }
  }

  PageViewModel _pageView({title, body, urlimg, urlLancher,}){
    return PageViewModel(
      //conjunto de parametros que serão passados para o meu metodo pageView
      title: title,
      body:body,
      image: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
        child: Image.network(urlimg), 
      ),
      ),
      footer: ElevatedButton(
        child: const Text("Let's Go!"),
        onPressed: (){
          _launcherURL(urlLancher);
        },
      ),//rodape
    );
  }

  @override
  Widget build(BuildContext context) {
    var listPages = [
      _pageView(title:'YouTube', body:'Inscreva-se e explore', urlimg:'https://cdn.pixabay.com/photo/2015/04/13/17/45/icon-720940_1280.png', urlLancher:'https://www.youtube.com'),
      _pageView(title:'Linkedin', body:'Acesse meu Linkedin e se conecte a mim', urlimg:'https://cdn.pixabay.com/photo/2016/11/18/11/16/social-1834011_1280.png', urlLancher:'https://www.linkedin.com/in/alana-silva-santos'),
      _pageView(title:'Instagram' ,body:'Siga-me no Instagram' ,urlimg:'https://cdn.pixabay.com/photo/2017/02/01/08/55/social-2029113_1280.png' , urlLancher:'https://www.instagram.com/eulana_s'),
    ];

    return Scaffold(
        body: IntroductionScreen(
        pages: listPages,
        next: const Icon(Icons.navigate_next),
        done: const Text('Fechar'),
        showSkipButton: true,
        skip: const Text('Pular'),
        onDone: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MyHomePage(),));
        },
        onSkip: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MyHomePage(),));
        },
      )
    );
  }
}
