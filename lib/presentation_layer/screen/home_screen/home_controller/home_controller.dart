import 'package:animal_app_dashboard/application_layer/ShardFunction/handling.dart';
import 'package:animal_app_dashboard/application_layer/ShardFunction/statusrequst.dart';
import 'package:animal_app_dashboard/data_layer/database/response.dart';
import 'package:animal_app_dashboard/data_layer/models/home-static-model.dart';
import 'package:animal_app_dashboard/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:get/get.dart';

// print(
//     "object=>>>${_controller.spots[0].value}>>>>>>>>>${_controller.spots[1].value}>>>>>>${_controller.spots[2].value}>>>>> ${_controller.spots[3].value}");
// final List<ChartData> chartData = [
//   // ChartData('Su', 35),
//   // ChartData('Mo', 23),
//   // ChartData('Tu', 34),
//   // ChartData('We', 25),
//   // ChartData('Thu', 40),
//   // ChartData('Fr', 30),
//   // ChartData('Sat', 45),
// ];

class HomeController extends GetxController {
  List<String> weeknams = [
    'Th',
    'Fr',
    'Sa',
    'Su',
    'Mo',
    'Tu',
    'We',
  ];
  final List<ChartData> chartData = [];
  late bool isload;
  HomeStaticModel? homeStaticModel;
  late StatusRequest statusRequest;
  getHomeRes() async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await getStaticHome();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        print('----------------------------------');
        homeStaticModel = await HomeStaticModel.fromJson(response);
        List<Chart>? chart = homeStaticModel!.data!.chart!;
        for (var i = 0; i < chart.length; i++) {
          chartData.add(
              ChartData(weeknams[i], chart[i].totalPrice?.toDouble() ?? 0.0));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.erorr;
    }
  }

  @override
  void onInit() async {
    isload = true;
    update();
    await getHomeRes();

    isload = false;
    update();
    super.onInit();
  }
}
