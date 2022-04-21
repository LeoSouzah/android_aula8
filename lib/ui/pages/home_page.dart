import 'package:aula8/ui/components/botao.dart';
import 'package:aula8/ui/components/campo_texto.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nota1Controller = TextEditingController();
  final _nota2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.school),
            SizedBox(
              width: 8,
            ),
            Text('Calcular Média'),
          ],
        ),
      ),
      body: ListView(
        children: [
          Image.asset('images/logo.png'),

          CampoTexto(
            controlador: _nota1Controller,
            teclado: TextInputType.number,
            label: 'Nota do 1° Bimestre',
            prefixoTexto: 'Nota: ',
            prefixoIcone: Icon(Icons.arrow_forward),
          ),
          CampoTexto(
            controlador: _nota2Controller,
            teclado: TextInputType.number,
            label: 'Nota do 2° Bimestre',
            prefixoTexto: 'Nota: ',
            prefixoIcone: Icon(Icons.arrow_forward),
          ),
          Botao(
            texto: 'Calcular',
            clique: _calcularClique,
          ),
        ],
      ),
    );
  }

  void _calcularClique() {
    double nota1 = double.tryParse(_nota1Controller.text.replaceAll(',','.')) ?? -1;
    double nota2 = double.tryParse(_nota2Controller.text.replaceAll(',','.')) ?? -1;

    if ((nota1 < 0) || (nota1 > 10)){
      _mostrarMensagem('Nota do 1° Bimestre inválida!');
      return;
    }

    if ((nota2 < 0) || (nota2 > 10)) {
      _mostrarMensagem('Nota do 2° Bimestre inválida!');
      return;
    }

    double media = (nota1 + nota2) /2;
    
    _mostrarMensagem('Aluno ${(media >= 7 )? 'APROVADO' : 'REPROVADO'} com média $media');
  }

  void _mostrarMensagem(String texto) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Calcular Média'),
            content: Text(texto),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'),
              )
            ],
          );
        });
  }
}
