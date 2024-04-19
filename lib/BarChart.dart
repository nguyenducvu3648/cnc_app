import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class barChart extends StatefulWidget {
  @override
  _barChartState createState() => _barChartState();
}

class _barChartState extends State<barChart>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bar Chart with Secondary Axis Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bar Chart '),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.7,
            child: BarChartWithSecondaryAxis.withSampleData(),

          ),
        ),
      ),
    );
  }
}



class BarChartWithSecondaryAxis extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final List<charts.Series<OrdinalSales, String>> seriesList;
  final bool animate;

  BarChartWithSecondaryAxis(this.seriesList, {this.animate = true});

  factory BarChartWithSecondaryAxis.withSampleData() {
    return BarChartWithSecondaryAxis(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      primaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(desiredTickCount: 4),
        viewport: charts.NumericExtents(0, 1200),
      ),
      secondaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(desiredTickCount: 4),
        viewport: charts.NumericExtents(0, 24),
      ),
      defaultInteractions: false,
      behaviors: [
        charts.SeriesLegend(
          position: charts.BehaviorPosition.bottom,
          horizontalFirst: false,
          desiredMaxRows: 2,
          cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
        ),
      ],
    );
  }
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final globalSalesData = [
      OrdinalSales('Mon', 400),
      OrdinalSales('Tue', 250),
      OrdinalSales('Wed', 100),
      OrdinalSales('Thu', 750),
      OrdinalSales('Fri', 100),
      OrdinalSales('Sat', 100),
      OrdinalSales('Sun', 900),
    ];

    final losAngelesSalesData = [
      OrdinalSales('Mon', 12),
      OrdinalSales('Tue', 10),
      OrdinalSales('Wed', 08),
      OrdinalSales('Thu', 11),
      OrdinalSales('Fri', 12),
      OrdinalSales('Sat', 09),
      OrdinalSales('Sun', 13),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'products',
        domainFn: (sales, _) => sales.dayOfWeek,
        measureFn: (sales, _) => sales.sales,
        data: globalSalesData,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'time',
        domainFn: (sales, _) => sales.dayOfWeek,
        measureFn: (sales, _) => sales.sales,
        data: losAngelesSalesData,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }
}

class OrdinalSales {
  final String dayOfWeek;
  final int sales;

  OrdinalSales(this.dayOfWeek, this.sales);
}


