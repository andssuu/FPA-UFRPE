import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alerts> {
  final _alerts = [
    "Alerta 1",
    "Alerta 2",
    "Alerta 3",
    "Alerta 4",
    "Alerta 5",
    "Alerta 6",
    "Alerta 7",
    "Alerta 8",
    "Alerta 9",
    "Alerta 10",
    "Alerta 11",
    "Alerta 12",
    "Alerta 13",
    "Alerta 14",
    "Alerta 15"
  ];
  final _biggerFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Alertas'),
      ),
      body: _buildAlerts(),
    );
  }

  Widget _buildAlerts() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      // Let the ListView know how many items it needs to build.
      itemCount: _alerts.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = _alerts[index];
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
