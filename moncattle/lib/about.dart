import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Aplicativo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "MonCattle",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Disciplina',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Fundamentos de Programação Aplicada",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Período',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "2020.1",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Professor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Gilberto Cysneiros",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Desenvolvedor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Anderson Santos",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Sobre'),
      ),
      body: ListView(
        children: [
          Center(
            child: Image.asset(
              'assets/images/cow_head.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          titleSection,
          //buttonSection,
          //textSection,
        ],
      ),
    );
  }
}
