import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final VoidCallback clique;

  const Botao({required this.texto, required this.clique, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:clique,
      child: Text(texto),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.red),
        shape: MaterialStateProperty.all (RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
