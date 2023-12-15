import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _GoalPageState createState() => _GoalPageState();
}

class _GoalPageState extends State<Home> {
  double dailyGoal = 1000; // Set your daily goal here
  double dailyValue = 700; // Set the user's daily value here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Goal Progress'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Daily Goal: $dailyGoal',
              style: TextStyle(fontSize: 20.0),
            ),
              Text(
                  'Daily Progress: $dailyValue',

                  style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 70.0),
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: dailyValue / dailyGoal,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  strokeWidth: 100.0,
                ),
                // Text(
                //   '${dailyValue.toInt()} / $dailyGoal',
                //   style: TextStyle(fontSize: 20.0),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
