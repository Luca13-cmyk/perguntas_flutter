import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './Questionario.dart';
import './Resultado.dart';
main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {

var _perguntaSelecionada = 0;
var _pontuacaoTotal = 0;

final _perguntas = const [

      {
        "texto": 'Qual é a sua cor favorita?',
        'respostas': [
          {'texto': 'preto', 'pontuacao': 10},
          {'texto': 'vermelho', 'pontuacao': 7},
          {'texto': 'branco', 'pontuacao': 5},
          {'texto': 'azul', 'pontuacao': 1}]
      },
      {
        "texto": 'Qual é o seu animal favorito?',
        'respostas': [
            {'texto': 'tigre', 'pontuacao': 10},
            {'texto': 'leao', 'pontuacao': 1},
            {'texto': 'gato', 'pontuacao': 5},
            {'texto': 'cachorro', 'pontuacao': 7},
            {'texto': 'elefante', 'pontuacao': 3}
            ]
      },
      {
        "texto": 'Qual é o seu instrutor favorito?',
        'respostas': [
          {'texto': 'maria', 'pontuacao': 10},
          {'texto': 'leo', 'pontuacao': 5},
          {'texto': 'joao', 'pontuacao': 6},
          {'texto': 'carlos', 'pontuacao': 1}
          ]
      }
      

    ];

  void _responder(int pontuacao) {  // Void significa q n retorna nada

if (temPerguntaSelecionada) {
    setState(() {

      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
      
    });
  }

  print(_pontuacaoTotal); 
}

  void _reiniciarQuestionario()
  {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }
bool get temPerguntaSelecionada {

    return _perguntaSelecionada < _perguntas.length;

  }
  

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada ? Questionario(perguntas: _perguntas,
         perguntaSelecionada: _perguntaSelecionada,
         responder: _responder,) : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),

    );
  }
}

class PerguntaApp extends StatefulWidget {
  
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }

}