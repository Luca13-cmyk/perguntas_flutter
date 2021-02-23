import 'package:flutter/material.dart';
import './Resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;

  final int perguntaSelecionada;

  final void  Function(int) responder;

  Questionario(
    {
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
    }
    );

    bool get temPerguntaSelecionada {

    return this.perguntaSelecionada < this.perguntas.length;

  }

  @override
  Widget build(BuildContext context) {

  List<Map<String, Object>> respostas =  this.temPerguntaSelecionada ?
   this.perguntas[this.perguntaSelecionada]['respostas'] : null;

    return Column(
          children: [
            Questao(this.perguntas[this.perguntaSelecionada]['texto']),
            ...respostas.map((resp) => Resposta(resp['texto'],
             () => this.responder(resp['pontuacao'])))
            .toList(), // Jogar cd um na lista children
          ],
        );
  }
}