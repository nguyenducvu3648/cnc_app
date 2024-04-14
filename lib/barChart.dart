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
        tickProviderSpec: charts.BasicNumericTickProviderSpec(desiredTickCount: 3),
        viewport: charts.NumericExtents(0, 1000000),
      ),
      secondaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(desiredTickCount: 3),
      ),
      defaultInteractions: false,
      // Thêm renderer để thiết lập màu sắc cho từng cột
      customSeriesRenderers: [
        charts.BarTargetLineRendererConfig<String>(
          // ID của cột phụ
          customRendererId: secondaryMeasureAxisId,
          groupingType: charts.BarGroupingType.grouped,
        ),
      ],
      // Thêm legend để hiển thị chú thích
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
      OrdinalSales('Mon', 400000),
      OrdinalSales('Tue', 25000),
      OrdinalSales('Wed', 100000),
      OrdinalSales('Thu', 750000),
      OrdinalSales('Fri', 100000),
      OrdinalSales('Sat', 100000),
      OrdinalSales('Sun', 90000),
    ];

    final losAngelesSalesData = [
      OrdinalSales('Mon', 40),
      OrdinalSales('Tue', 40),
      OrdinalSales('Wed', 10),
      OrdinalSales('Thu', 20),
      OrdinalSales('Fri', 50),
      OrdinalSales('Sat', 10),
      OrdinalSales('Sun', 20),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'products',
        domainFn: (sales, _) => sales.dayOfWeek,
        measureFn: (sales, _) => sales.sales,
        data: globalSalesData,
        // Thiết lập màu cho cột chính
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'time',
        domainFn: (sales, _) => sales.dayOfWeek,
        measureFn: (sales, _) => sales.sales,
        data: losAngelesSalesData,
        // Thiết lập màu cho cột phụ
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

  

