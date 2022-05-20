import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';
import 'package:smartfit/shared/loading.dart';

import '../../models/workout_data.dart';
import '../../services/database.dart';
import 'components/exercise_card.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: kHintTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;

    if (analysisType == "Daily") {
      switch (value.toInt()) {
        case 0:
          text = const Text('SUN', style: style);
          break;
        case 1:
          text = const Text('MON', style: style);
          break;
        case 2:
          text = const Text('TUES', style: style);
          break;
        case 3:
          text = const Text('WED', style: style);
          break;
        case 4:
          text = const Text('THUR', style: style);
          break;
        case 5:
          text = const Text('FRI', style: style);
          break;
        case 6:
          text = const Text('SAT', style: style);
          break;
        default:
          text = const Text('', style: style);
          break;
      }
    } else if (analysisType == "Monthly") {
      switch (value.toInt()) {
        case 0:
          text = const Text('Jan', style: style);
          break;
        case 1:
          text = const Text('Feb', style: style);
          break;
        case 2:
          text = const Text('Mar', style: style);
          break;
        case 3:
          text = const Text('Apr', style: style);
          break;
        case 4:
          text = const Text('May', style: style);
          break;
        case 5:
          text = const Text('Jun', style: style);
          break;
        case 6:
          text = const Text('Jul', style: style);
          break;
        case 7:
          text = const Text('Aug', style: style);
          break;
        case 8:
          text = const Text('Sep', style: style);
          break;
        case 9:
          text = const Text('Oct', style: style);
          break;
        case 10:
          text = const Text('Nov', style: style);
          break;
        case 11:
          text = const Text('Dec', style: style);
          break;
        default:
          text = const Text('', style: style);
          break;
      }
    } else {
      switch (value.toInt()) {
        case 0:
          text = const Text('Week 1', style: style);
          break;
        case 1:
          text = const Text('Week 2', style: style);
          break;
        case 2:
          text = const Text('Week 3', style: style);
          break;
        case 3:
          text = const Text('Week 4', style: style);
          break;
        default:
          text = const Text('', style: style);
          break;
      }
    }
    return Padding(child: text, padding: const EdgeInsets.only(top: 8.0));
  }

  String analysisType = "Daily";

  // Function getSpot(analysisType){

  // }

  void setSelectedButton(String buttonName) {
    setState(() {
      analysisType = buttonName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return StreamBuilder<WorkoutData>(
        stream: DatabaseService(uid: user!.uid).workoutData,
        builder: (context, snapshot) {
          return Background(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Logo()],
                      ),
                      Text(
                        "Hello, ${user.displayName} ",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text("Track Your Progress",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 40),
                      const Text("Recent exercises",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ExerciseCard(
                            ImageUrl: 'assets/images/arms.png',
                          ),
                          ExerciseCard(
                            ImageUrl: 'assets/images/cardio.png',
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              analysisType = 'Daily';
                              setState(() {
                                setSelectedButton("Daily");
                              });
                            },
                            child: Text(
                              "Daily",
                              style: analysisType == 'Daily'
                                  ? const TextStyle(color: Colors.white)
                                  : const TextStyle(color: Color(0xFFCBCBCB)),
                            ),
                            style: analysisType == 'Daily'
                                ? TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: kPrimaryColor,
                                    elevation: 10,
                                    shadowColor: kPrimaryColor,
                                    onSurface: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                : null,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                setSelectedButton("Weekly");
                              });
                            },
                            child: Text(
                              "Weekly",
                              style: analysisType == 'Weekly'
                                  ? const TextStyle(color: Colors.white)
                                  : const TextStyle(color: Color(0xFFCBCBCB)),
                            ),
                            style: analysisType == 'Weekly'
                                ? TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: kPrimaryColor,
                                    elevation: 10,
                                    shadowColor: kPrimaryColor,
                                    onSurface: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                : null,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                setSelectedButton("Monthly");
                              });
                            },
                            child: Text(
                              "Monthly",
                              style: analysisType == 'Monthly'
                                  ? const TextStyle(color: Colors.white)
                                  : const TextStyle(color: Color(0xFFCBCBCB)),
                            ),
                            style: analysisType == 'Monthly'
                                ? TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: kPrimaryColor,
                                    elevation: 10,
                                    shadowColor: kPrimaryColor,
                                    onSurface: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                : null,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 93,
                        child: snapshot.hasData
                            ? LineChart(LineChartData(
                                minX: 0,
                                minY: 0,
                                gridData: FlGridData(
                                  show: false,
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: null,
                                  topTitles: null,
                                  leftTitles: null,
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 30,
                                      getTitlesWidget: bottomTitleWidgets,
                                      interval: 1,
                                    ),
                                  ),
                                ),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      const FlSpot(0, 4),
                                      const FlSpot(1, 4),
                                      const FlSpot(2, 4),
                                      const FlSpot(3, 4),
                                      const FlSpot(4, 4),
                                      const FlSpot(5, 4),
                                      const FlSpot(6, 4),
                                    ],
                                    isCurved: true,
                                    color: kPrimaryColor,
                                    barWidth: 4,
                                  )
                                ],
                              ))
                            : Loading(),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
