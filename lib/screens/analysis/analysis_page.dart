import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';

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

    return Padding(child: text, padding: const EdgeInsets.only(top: 8.0));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    String analysisType = 'Daily';
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Logo()],
            ),
            if (user?.displayName == null)
            const Text("Hello User")
          else
            Text(
              "Hello " + user!.displayName.toString() + ",",
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const Text("Track Your Progress",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            const Text("Recent exercises",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
                    setState(() {});
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
                              borderRadius: BorderRadius.circular(20)),
                        )
                      : null,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      analysisType = 'Weekly';
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
                              borderRadius: BorderRadius.circular(20)),
                        )
                      : null,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      analysisType = 'Monthly';
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
                              borderRadius: BorderRadius.circular(20)),
                        )
                      : null,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      analysisType = 'Yearly';
                    });
                  },
                  child: Text(
                    "Yearly",
                    style: analysisType == 'Yearly'
                        ? const TextStyle(color: Colors.white)
                        : const TextStyle(color: Color(0xFFCBCBCB)),
                  ),
                  style: analysisType == 'Yearly'
                      ? TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: kPrimaryColor,
                          elevation: 10,
                          shadowColor: kPrimaryColor,
                          onSurface: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 93,
              child: LineChart(LineChartData(
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
                      const FlSpot(2, 5),
                      const FlSpot(3, 3.6),
                      const FlSpot(4, 4.2),
                      const FlSpot(5, 4.4),
                    ],
                    isCurved: true,
                    color: kPrimaryColor,
                    barWidth: 4,
                  )
                ],
              )),
            ),
          ]),
        ),
      ),
    );
  }
}
