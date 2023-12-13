import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSectionTitle('Your Footsteps'),
            buildSizedBox(10),
            const InteractiveLineChart(),
            buildSectionTitle('Total Footsteps'),
            buildSizedBox(10),
            const CumulativeLineChart(),
          ],
        ),
      ),
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

class InteractiveLineChart extends StatelessWidget {
  const InteractiveLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> dataPoints = [
      //const FlSpot(0, 100),
      const FlSpot(0, 150),
      const FlSpot(1, 160),
      const FlSpot(2,190),
      // Add more data points as needed
    ];

    // Check for invalid values (Infinity or NaN) and replace with default values
    dataPoints.removeWhere((spot) => spot.y.isNaN || spot.y.isInfinite);
    dataPoints = dataPoints.isNotEmpty ? dataPoints : [const FlSpot(0, 0)];

    return SizedBox(
      height: 250, // Set a fixed height for the chart
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: const Color(0xff37434d),
              width: 1,
            ),
          ),
          minX: 0,
          maxX: dataPoints.length.toDouble() - 1,
          minY: 0,
          maxY: 250,
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              color: Colors.blue,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

class AxisTitle {
}

class CumulativeLineChart extends StatelessWidget {
  const CumulativeLineChart({super.key});

  @override
  Widget build(BuildContext context) {

    List<FlSpot> dataPoints = [
      const FlSpot(0, 500),
      const FlSpot(1, 700),
      const FlSpot(2, 300),
      // Add more data points as needed
    ];

    // Check for invalid values (Infinity or NaN) and replace with default values
    dataPoints.removeWhere((spot) => spot.y.isNaN || spot.y.isInfinite);
    dataPoints = dataPoints.isNotEmpty ? dataPoints : [const FlSpot(0, 0)];

    return SizedBox(
      height: 250, // Set a fixed height for the chart
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: false,
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: const Color(0xff37434d),
              width: 1,
            ),
          ),
          minX: 0,
          maxX: dataPoints.length.toDouble() - 1,
          minY: 0,
          maxY: 1000,
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              color: Colors.green,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
