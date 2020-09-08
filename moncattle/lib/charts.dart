/// Simple pie chart with outside labels example.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PieOutsideLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  PieOutsideLabelChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory PieOutsideLabelChart.withSampleData() {
    return new PieOutsideLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gráficos"),
          elevation: .1,
          backgroundColor: Colors.black87,
        ),
        body: charts.PieChart(seriesList,
            animate: animate,
            // Add an [ArcLabelDecorator] configured to render labels outside of the
            // arc with a leader line.
            //
            // Text style for inside / outside can be controlled independently by
            // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
            //
            // Example configuring different styles for inside/outside:
            //       new charts.ArcLabelDecorator(
            //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
            //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
            defaultRenderer:
                new charts.ArcRendererConfig(arcRendererDecorators: [
              new charts.ArcLabelDecorator(
                labelPosition: charts.ArcLabelPosition.outside,
              )
            ])));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '123',
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  LinearSales(this.year, this.sales);
}
