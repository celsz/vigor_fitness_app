import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vigor_fitness_app/widgets/universal_details_page.dart';

class SummaryPage extends StatelessWidget{
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Обзор"),),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: PieChart(
              PieChartData(
                  sections: [
                    PieChartSectionData(title: "test1", value: 55),
                    PieChartSectionData(title: "test2", value: 45),]
              )
          ),
        ),
      ),
    );

  }
}