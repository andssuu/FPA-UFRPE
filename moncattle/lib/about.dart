import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Sobre'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
        child: Expanded(
          flex: 1,
          child: new SingleChildScrollView(
            scrollDirection: Axis.vertical, //.horizontal
            child: Text(
              '\n\nO aplicativo consistirá em uma ferramenta de alto nível para o monitoramento do gado leiteiro. Exibirá informações relativas ao comportamento dos animais com o objetivo de ajudar o produtor numa melhor tomada de decisão. Comportamentos como andando, ócio, pastando e ruminando são interessantes para otimização de recursos no manejo dos animais. Dentre tais informações de comportamento, é possível destacar a ruminação do animal na detecção de doenças e no cio.\n\n\n' +
                  'Além disso, será possível visualizar e identificar por meio de um mapa, em tempo real, qual e onde cada animal está. O aplicativo conterá um sistema de alertas que notificará ao produtor eventos de interesse. Os dados serão obtidos por meio de um dispositivo embutido em uma coleira colocada no pescoço do animal capturando dados dos movimentos (acelerômetro) e a localização (GPS).\n\n\n' +
                  'Esses dados serão enviados por meio de um sistema telemétrico, processados e armazenados em um servidor. Na etapa de processamento dos dados, será executada uma heurística que implementa a classificação dos comportamentos mediante a utilização de algoritmos de machine learning. Tal servidor será o responsável pela alimentação das informações ao aplicativo. O usuário poderá adicionar e excluir os animais que assim o desejar mediante uma autenticação feita no servidor.\n\n\n',
              style: new TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}