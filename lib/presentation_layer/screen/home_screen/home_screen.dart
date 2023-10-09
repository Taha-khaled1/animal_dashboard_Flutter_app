import 'dart:math';

import 'package:animal_app_dashboard/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:animal_app_dashboard/presentation_layer/components/appbar1.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/color_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/font_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/styles_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'home_controller/home_controller.dart';

DateTime selectedDate = DateTime.now();

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('لوحة التحكم'),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return !controller.isload
              ? Container(
                  alignment: Alignment.topCenter,
                  child: InfoWidget(
                    builder: (context, deviceInfo) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تقارير اليوم',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s25,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMMd('ar').format(selectedDate),
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kTextlightgray,
                              fontSize: FontSize.s27,
                            ),
                          ),
                          Text(
                            '${controller.homeStaticModel?.data?.totalSales.toString()}',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kPrimary,
                              fontSize: FontSize.s25,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            // crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.spaceEvenly,
                            direction: Axis.horizontal,
                            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SquerText(
                                text:
                                    '${controller.homeStaticModel?.data?.waitingList.toString()}',
                                title: 'قائمة الانتظار',
                              ),
                              SquerText(
                                text:
                                    '${controller.homeStaticModel?.data?.services.toString()}',
                                title: 'الخدمات',
                              ),
                              SquerText(
                                text:
                                    '${controller.homeStaticModel?.data?.closed.toString()}',
                                title: 'مغلق',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: BarChartWidget(controller: controller),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class SquerText extends StatelessWidget {
  const SquerText({
    super.key,
    required this.title,
    required this.text,
  });
  final String title, text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 125,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xffC4C4C4).withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: MangeStyles().getRegularStyle(
              color: ColorManager.white,
              fontSize: FontSize.s20,
            ),
          ),
          Text(
            text,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kPrimary2,
              fontSize: FontSize.s20,
            ),
          ),
        ],
      ),
    );
  }
}

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: OrientationBuilder(
            builder: (context, orientation) {
              final bool isPortrait = orientation == Orientation.landscape;
              return Container(
                child: SfCartesianChart(
                  series: <ChartSeries>[
                    // Renders bar chart
                    BarSeries<ChartData, String>(
                      dataSource: controller.chartData,
                      xValueMapper: (ChartData data, _) => data.name.toString(),
                      yValueMapper: (ChartData data, _) => data.value,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true, // Enables the data label
                        labelPosition: ChartDataLabelPosition.inside,

                        // Positions the data label
                        // You can also use other properties to style the data labels
                      ),
                    )
                  ],
                  plotAreaBorderWidth: 1,
                  isTransposed: true,
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChartData {
  String name;
  double value;

  ChartData(this.name, this.value);
}

class BarChartSample2 extends StatefulWidget {
  BarChartSample2({super.key});
  final Color leftBarColor = ColorManager.kPrimary;
  final Color rightBarColor = ColorManager.kTextlightgray;
  final Color avgColor = AppColors.contentColorOrange;
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                makeTransactionsIcon(),
                const Text(
                  'التحويلات',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                const Text(
                  'الحاله',
                  style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                            barRods: showingBarGroups[touchedGroupIndex]
                                .barRods
                                .map((rod) {
                              return rod.copyWith(
                                  toY: avg, color: widget.avgColor);
                            }).toList(),
                          );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
