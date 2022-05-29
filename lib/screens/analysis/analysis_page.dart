import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/models/workouts.dart';
import 'package:smartfit/screens/home/components/home_card.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';
import 'package:smartfit/shared/loading.dart';

import '../../models/workout_data.dart';
import '../../services/database.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  late int exerciseLen;

  String analysisType = "Daily";

  List<FlSpot> getSpot(analysisType) {
    if (analysisType == "Daily") {
      return [
        const FlSpot(0, 4),
        const FlSpot(1, 4),
        const FlSpot(2, 4),
        const FlSpot(3, 4),
        const FlSpot(4, 4),
        const FlSpot(5, 4),
        const FlSpot(6, 4),
      ];
    } else if (analysisType == "Monthly") {
      return [
        const FlSpot(0, 4),
        const FlSpot(1, 4),
        const FlSpot(2, 4),
        const FlSpot(3, 4),
        const FlSpot(4, 4),
        const FlSpot(5, 4),
        const FlSpot(6, 4),
        const FlSpot(7, 4),
        const FlSpot(8, 4),
        const FlSpot(9, 4),
        const FlSpot(10, 4),
        const FlSpot(11, 4),
      ];
    } else {
      return [
        const FlSpot(0, 4),
        const FlSpot(1, 4),
        const FlSpot(2, 4),
        const FlSpot(3, 4),
      ];
    }
  }

  void setSelectedButton(String buttonName) {
    setState(() {
      analysisType = buttonName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final workouts = Provider.of<List<Workouts>>(context);

    return StreamBuilder<WorkoutData>(
        stream: DatabaseService(uid: user!.uid).workoutData,
        builder: (context, snapshot) {
          exerciseLen = snapshot.data?.exercisesDone.length as int;
          Widget bottomTitleWidgets(double value, TitleMeta meta) {
            const style = TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            );
            Widget text;
            if (analysisType == "Daily") {
              var res = snapshot.data?.exercisesDone.where((element) =>
                  element.timeStamp.month == DateTime.now().month &&
                  element.timeStamp.day < DateTime.now().day - 7);
              print('batatata taa $res');
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
            return Padding(
                child: text, padding: const EdgeInsets.only(top: 8.0));
          }

          const gradientColors = [
            Color(0x00ff7000),
            Color(0x00ffffff),
          ];
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
                        children: [
                          HomeCard(
                            imageUrl: 'assets/images/${workouts[0].imageName}',
                            exercices: workouts[0].exercices.length,
                            minutes: workouts[0].totalMinutes,
                            name: workouts[0].name,
                          ),
                          HomeCard(
                            imageUrl: 'assets/images/${workouts[1].imageName}',
                            exercices: workouts[1].exercices.length,
                            minutes: workouts[1].totalMinutes,
                            name: workouts[1].name,
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
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        elevation: 14,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Time Spent',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 100,
                                  width:
                                      0.8 * MediaQuery.of(context).size.width,
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
                                            rightTitles: AxisTitles(
                                              sideTitles:
                                                  SideTitles(showTitles: false),
                                            ),
                                            topTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                    showTitles: false)),
                                            leftTitles: AxisTitles(
                                              sideTitles:
                                                  SideTitles(showTitles: false),
                                            ),
                                            bottomTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                showTitles: true,
                                                getTitlesWidget:
                                                    bottomTitleWidgets,
                                                interval: 1,
                                              ),
                                            ),
                                          ),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: getSpot(analysisType),
                                              isCurved: true,
                                              color: kPrimaryColor,
                                              barWidth: 4,
                                              belowBarData: BarAreaData(
                                                  show: true,
                                                  gradient: LinearGradient(
                                                      colors: gradientColors
                                                          .map((color) => color
                                                              .withOpacity(0.7))
                                                          .toList(),
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter)),
                                            )
                                          ],
                                        ))
                                      : Loading(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
