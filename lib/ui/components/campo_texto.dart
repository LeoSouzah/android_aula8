import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controlador;
  final TextInputType? teclado;
  final String? label;
  final String? prefixoTexto;
  final Widget? prefixoIcone;

  const CampoTexto(
      {required this.controlador,
      this.teclado,
      this.label,
      this.prefixoTexto,
      this.prefixoIcone,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: controlador,
        keyboardType: teclado ?? TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: label,
          prefixText: prefixoTexto,
          prefixIcon: prefixoIcone,
        ),
      ),
    );
  }
}
