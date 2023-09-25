// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

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
          series: <SplineSeries<SaleData,String>>[
            SplineSeries<SaleData,String>(
              width: 3,
              color: Color.fromARGB(255, 47, 127, 121),
              dataSource: <SaleData>[
               SaleData(100, 'mon'),
               SaleData(20, 'tue'),
               SaleData(50, 'wes'),
               SaleData(80, 'thu'),
               SaleData(80, 'sat'),
              ],
               xValueMapper: (SaleData sales,_)=>sales.year,
              yValueMapper: (SaleData sales,_)=>sales.sales,
              )
          ],
        ),

      );
  }
}

class SaleData{

  SaleData(this.sales,this.year);
  final String year;
  final int sales;



}