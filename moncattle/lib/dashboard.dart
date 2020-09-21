import 'package:flutter/material.dart';
import 'package:moncattle/alerts.dart';
import 'package:moncattle/graphics.dart';
import 'list_animals.dart';
import 'map.dart';
import 'about.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
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
            //makeDashboardItem("Relatórios", Icons.report_outlined, 0),
            makeDashboardItem("Alertas", Icons.alarm, 3),
            makeDashboardItem("Sobre", Icons.accessibility, 4),
          ],
        ),
      ),
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
