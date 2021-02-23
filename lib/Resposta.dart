
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String texto;

  final void Function() onSelecao;

  Resposta(this.texto, this.onSelecao); 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(this.texto),
        onPressed: onSelecao,
        
      ),
    );
  }
}