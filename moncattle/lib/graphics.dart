import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cow_notifier.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graphics extends StatefulWidget {
  @override
  _GraphicsState createState() => _GraphicsState();
}

class _GraphicsState extends State<Graphics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gráficos"),
        elevation: .1,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 1,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            _buildChartsBreed(),
            //_buildChartsBreed(),
            //_buildChartsBreed(),
          ],
        ),
      ),
    );
  }

  Widget _buildChartsBreed() {
    return Consumer<CowNotifier>(
      builder: (context, animals, child) {
        //print(animals.cows);
        return Container(
          height: 300,
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: new charts.BarChart(
            _createSampleData(),
            animate: true,
            barRendererDecorator: new charts.BarLabelDecorator<String>(),
            domainAxis: new charts.OrdinalAxisSpec(),
            behaviors: [
              new charts.ChartTitle('Raças',
                  behaviorPosition: charts.BehaviorPosition.top,
                  titleOutsideJustification: charts.OutsideJustification.start,
                  innerPadding: 20),
            ],
          ),
        );
      },
    );
  }

  List<charts.Series<LinearBreeds, String>> _createSampleData() {
    var animals = context.read<CowNotifier>();
    int total = animals.cows.length;
    print(total);
    var map = Map();
    animals.cows.forEach(
      (cow) {
        if (!map.containsKey(cow.breed)) {
          map[cow.breed] = 1;
        } else {
          map[cow.breed] += 1;
        }
      },
    );
    print(map);
    List<LinearBreeds> data = [];
    map.forEach((key, value) {
      data.add(new LinearBreeds(key, value));
    });
    return [
      new charts.Series<LinearBreeds, String>(
        id: 'Breeds',
        domainFn: (LinearBreeds count, _) => count.name,
        measureFn: (LinearBreeds count, _) => count.count,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearBreeds row, _) => '${row.count}',
        colorFn: (_, __) => charts.MaterialPalette.black,
      )
    ];
  }
}

class LinearBreeds {
  final String name;
  final int count;
  LinearBreeds(this.name, this.count);
}
