import 'package:flutter/material.dart';
import 'package:moncattle/add_animal.dart';
import 'package:provider/provider.dart';
import 'animal_datail.dart';
import 'models/cow_notifier.dart';

class ListAnimals extends StatefulWidget {
  @override
  _ListAnimalsState createState() => _ListAnimalsState();
}

class _ListAnimalsState extends State<ListAnimals> {
  final _biggerFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Animais'),
      ),
      body: _buildListAnimals(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("add animal");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddAnimal()));
        },
        tooltip: 'Increment',
        backgroundColor: Colors.black87,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildListAnimals() {
    return Consumer<CowNotifier>(
      builder: (context, animals, child) {
        return ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: animals.cows.length,
          itemBuilder: (context, index) {
            final cow = animals.cows[index];
            return Dismissible(
              background: Container(
                color: Colors.red.withOpacity(0.7),
              ),
              onDismissed: (direction) {
                //print(direction);
                var cows = context.read<CowNotifier>();
                cows.removeCow(index);
              },
              key: Key(cow.idCollar),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimalDetail(cow: cow)));
                },
                title: Text(
                  cow.name,
                  style: _biggerFont,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
