import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:moncattle/alerts.dart';
import 'package:moncattle/graphics.dart';
import 'package:moncattle/models/alert.dart';
import 'package:moncattle/models/cow_notifier.dart';
import 'package:provider/provider.dart';
import 'list_animals.dart';
import 'map.dart';
import 'about.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState() {
    _registerOnFirebase();
    getMessage();
    super.initState();
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('received message');
      var alerts = context.read<CowNotifier>();
      alerts.addAlert(
        Alert(
          msg: message["notification"]["body"],
          time: DateTime.now(),
        ),
      );
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: ListTile(
            title: Text(message["notification"]["title"]),
            subtitle: Text(message["notification"]["body"]),
          ),
          actions: <Widget>[
            FlatButton(
                child: Text("OK"), onPressed: () => Navigator.of(context).pop())
          ],
        ),
      );
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume message');
      print(message['data']['title']);
      print(message['data']['body']);
      var alerts = context.read<CowNotifier>();
      alerts.addAlert(
        Alert(
          msg: message['data']['body'],
          time: DateTime.now(),
        ),
      );
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CowNotifier>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: AppBar(
            //iconTheme: new IconThemeData(color: Colors.green),
            title: Center(
              child: Text("MONCATTLE"),
            ),
            elevation: .1,
            backgroundColor: Colors.black87,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(3.0),
              children: <Widget>[
                makeDashboardItem("Animais", Icons.list_alt_outlined, 0),
                makeDashboardItem("Mapas", Icons.map_outlined, 1),
                makeDashboardItem("Gráficos", Icons.bar_chart, 2),
                makeDashboardItem("Alertas", Icons.alarm, 3),
                makeDashboardItem("Sobre", Icons.contact_support_outlined, 4),
              ],
            ),
          ),
        );
      },
    );
  }

  Card makeDashboardItem(String title, IconData icon, int _class) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) => ListAnimals()),
              //   (Route<dynamic> route) => false,
              // );
              switch (_class) {
                case 0:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListAnimals()));
                  break;
                case 1:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CowMap()));
                  break;
                case 2:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Graphics()));
                  break;
                case 3:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Alerts()));
                  break;
                case 4:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                  break;
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
