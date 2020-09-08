import 'package:flutter/material.dart';

class ListAnimals extends StatefulWidget {
  @override
  _ListAnimalsState createState() => _ListAnimalsState();
}

class _ListAnimalsState extends State<ListAnimals> {
  final _animals = [
    "Animal 1",
    "Animal 2",
    "Animal 3",
    "Animal 4",
    "Animal 5",
    "Animal 6",
    "Animal 7",
    "Animal 8",
    "Animal 9",
    "Animal 10",
    "Animal 11",
    "Animal 12",
    "Animal 13",
    "Animal 14",
    "Animal 15"
  ];
  final _biggerFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Animais'),
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("clicou");
        },
        tooltip: 'Increment',
        backgroundColor: Colors.black87,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      // Let the ListView know how many items it needs to build.
      itemCount: _animals.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = _animals[index];
        return ListTile(
          title: Text(
            item,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}
