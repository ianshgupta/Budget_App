import 'package:flutter/material.dart';
import 'package:budget_app/data/model/add_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {

  Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
       series: <SplineSeries<SalesData,String>>[
         SplineSeries<SalesData,String>(
           color: Colors.pink,
           width: 3,
           dataSource: <SalesData>[
             SalesData(10,'Monday'),
          SalesData(100,'Tuesday'),
          SalesData(10,"Wednesday"),
          SalesData(90,'Thursday'),
          SalesData(100,'Friday'),
          SalesData(30,'Saturday'),

          ],

          xValueMapper: (SalesData sales, _) => sales.sales,
        yValueMapper: (SalesData sales, _) => sales.year,
         )
       ],


          ),
    );

  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final int year;
  final String sales;
}