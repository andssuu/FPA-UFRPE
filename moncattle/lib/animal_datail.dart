import 'package:flutter/material.dart';
import 'models/cow.dart';

class AnimalDetail extends StatefulWidget {
  Cow cow;
  AnimalDetail({this.cow});
  @override
  _AnimalDetailState createState() => _AnimalDetailState();
}

class _AnimalDetailState extends State<AnimalDetail> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Nome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.cow.name,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'ID Colar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.cow.idCollar,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Peso',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.cow.weight,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Raça',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.cow.breed,
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
        title: Text('Detalhes'),
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
