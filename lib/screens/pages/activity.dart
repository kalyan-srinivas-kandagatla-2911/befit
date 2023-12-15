import 'package:flutter/material.dart';
//import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body:
      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       buildSectionTitle('Your Footsteps'),
      //       buildSizedBox(10),
      //       //const InteractiveLineChart(),
      //       //buildSectionTitle('Total Footsteps'),
      //       buildSizedBox(10),
      //       //const CumulativeLineChart(),
      //     ],
      //   ),
      // ),
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Your Footsteps graph'),
            // Enable legend
            //legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_Steps, String>>[
              LineSeries<_Steps, String>(
                  dataSource: <_Steps>[
                    _Steps('Jan', 35000),
                    _Steps('Feb', 28000),
                    _Steps('Mar', 34000),
                    _Steps('Apr', 32000),
                    _Steps('May', 40000),
                    _Steps('Jun', 60000)
                  ],
                  xValueMapper: (_Steps steps, _) => steps.year,
                  yValueMapper: (_Steps steps, _) => steps.steps,
                  // Enable data label
                  //dataLabelSettings: DataLabelSettings(isVisible: true)
             )
            ])
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget buildSizedBox(double height) {
    return SizedBox(height: height);
  }
}
class _Steps {
  _Steps(this.year, this.steps);

  final String year;
  final double steps;
}
// class InteractiveLineChart extends StatelessWidget {
//   const InteractiveLineChart({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<FlSpot> dataPoints = [
//       //const FlSpot(0, 100),
//       const FlSpot(0, 150),
//       const FlSpot(1, 160),
//       const FlSpot(2,190),
//       // Add more data points as needed
//     ];
//
//     // Check for invalid values (Infinity or NaN) and replace with default values
//     dataPoints.removeWhere((spot) => spot.y.isNaN || spot.y.isInfinite);
//     dataPoints = dataPoints.isNotEmpty ? dataPoints : [const FlSpot(0, 0)];
//
//     return SizedBox(
//       height: 250, // Set a fixed height for the chart
//       child: LineChart(
//         LineChartData(
//           gridData: FlGridData(show: false),
//           titlesData: FlTitlesData(show: false),
//           borderData: FlBorderData(
//             show: true,
//             border: Border.all(
//               color: const Color(0xff37434d),
//               width: 1,
//             ),
//           ),
//           minX: 0,
//           maxX: dataPoints.length.toDouble() - 1,
//           minY: 0,
//           maxY: 250,
//           lineBarsData: [
//             LineChartBarData(
//               spots: dataPoints,
//               isCurved: true,
//               color: Colors.blue,
//               dotData: FlDotData(show: false),
//               belowBarData: BarAreaData(show: false),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AxisTitle {
// }
//
// class CumulativeLineChart extends StatelessWidget {
//   const CumulativeLineChart({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     List<FlSpot> dataPoints = [
//       const FlSpot(0, 500),
//       const FlSpot(1, 700),
//       const FlSpot(2, 300),
//       // Add more data points as needed
//     ];
//
//     // Check for invalid values (Infinity or NaN) and replace with default values
//     dataPoints.removeWhere((spot) => spot.y.isNaN || spot.y.isInfinite);
//     dataPoints = dataPoints.isNotEmpty ? dataPoints : [const FlSpot(0, 0)];
//
//     return SizedBox(
//       height: 250, // Set a fixed height for the chart
//       child: LineChart(
//         LineChartData(
//           gridData: FlGridData(
//             show: false,
//           ),
//           titlesData: FlTitlesData(
//             show: false,
//           ),
//           borderData: FlBorderData(
//             show: true,
//             border: Border.all(
//               color: const Color(0xff37434d),
//               width: 1,
//             ),
//           ),
//           minX: 0,
//           maxX: dataPoints.length.toDouble() - 1,
//           minY: 0,
//           maxY: 1000,
//           lineBarsData: [
//             LineChartBarData(
//               spots: dataPoints,
//               isCurved: true,
//               color: Colors.green,
//               dotData: FlDotData(show: false),
//               belowBarData: BarAreaData(show: false),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
