import 'package:flutter/material.dart';
import 'package:moncattle/alerts.dart';
import 'list_animals.dart';
import 'map.dart';
import 'charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
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
    List<charts.Series<CowStatus, int>> _createSampleData() {
      final data_1 = [
        new CowStatus('Normal', 50),
      ];

      final data_2 = [
        new CowStatus('Cio', 50),
      ];

      final data_3 = [
        new CowStatus('Análise', 25),
      ];

      return [
        new charts.Series<CowStatus, int>(
          id: '123',
          domainFn: (CowStatus status, _) => status.quantidade,
          measureFn: (CowStatus status, _) => status.quantidade,
          data: data_1,
        ),
        //   new charts.Series<CowStatus, int>(
        //     id: '123123',
        //     domainFn: (CowStatus status, _) => status.quantidade,
        //     measureFn: (CowStatus status, _) => status.quantidade,
        //     data: data_2,
        //   ),
        //   new charts.Series<CowStatus, int>(
        //     id: '123123',
        //     domainFn: (CowStatus status, _) => status.quantidade,
        //     measureFn: (CowStatus status, _) => status.quantidade,
        //     data: data_3,
        //   ),
      ];
    }

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        body: charts.PieChart(
                          _createSampleData(),
                          animate: false,
                          // Add the legend behavior to the chart to turn on legends.
                          // This example shows how to optionally show measure and provide a custom
                          // formatter.
                          behaviors: [
                            new charts.DatumLegend(
                              // Positions for "start" and "end" will be left and right respectively
                              // for widgets with a build context that has directionality ltr.
                              // For rtl, "start" and "end" will be right and left respectively.
                              // Since this example has directionality of ltr, the legend is
                              // positioned on the right side of the chart.
                              position: charts.BehaviorPosition.end,
                              // By default, if the position of the chart is on the left or right of
                              // the chart, [horizontalFirst] is set to false. This means that the
                              // legend entries will grow as new rows first instead of a new column.
                              horizontalFirst: false,
                              // This defines the padding around each legend entry.
                              cellPadding:
                                  new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              // Set [showMeasures] to true to display measures in series legend.
                              showMeasures: true,
                              // Configure the measure value to be shown by default in the legend.
                              legendDefaultMeasure:
                                  charts.LegendDefaultMeasure.lastValue,
                              // Optionally provide a measure formatter to format the measure value.
                              // If none is specified the value is formatted as a decimal.
                              measureFormatter: (num value) {
                                return value == null ? '-' : '${value}k';
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
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

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  LinearSales(this.year, this.sales);
}

class CowStatus {
  final String comportamento;
  final int quantidade;
  CowStatus(this.comportamento, this.quantidade);
}
