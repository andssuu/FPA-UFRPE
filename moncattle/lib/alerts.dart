import 'package:flutter/material.dart';
import 'package:moncattle/models/cow_notifier.dart';
import 'package:provider/provider.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alerts> {
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
    return Consumer<CowNotifier>(builder: (context, data, child) {
      return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: data.alerts.length,
        itemBuilder: (context, index) {
          final alert = data.alerts[index];
          return Dismissible(
            background: Container(
              color: Colors.red.withOpacity(0.7),
            ),
            onDismissed: (direction) {
              //print(direction);
              var alerts = context.read<CowNotifier>();
              alerts.removeAlert(index);
            },
            key: UniqueKey(),
            child: ListTile(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => AnimalDetail(cow: cow)));
              },
              title: Text(
                alert.msg,
                style: _biggerFont,
              ),
            ),
          );
        },
      );
    });
  }
}
