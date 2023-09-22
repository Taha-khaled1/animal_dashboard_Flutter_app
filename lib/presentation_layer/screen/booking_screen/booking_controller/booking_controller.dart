import 'package:animal_app_dashboard/application_layer/ShardFunction/handling.dart';
import 'package:animal_app_dashboard/application_layer/ShardFunction/statusrequst.dart';
import 'package:animal_app_dashboard/data_layer/database/response.dart';
import 'package:animal_app_dashboard/data_layer/models/servicw_order_model.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  late bool isload;
  ServiceOrder? serviceOrder;
  late StatusRequest statusRequest;
  getHomeRes(String data) async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await getHome(data);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        print('----------------------------------');
        serviceOrder = await ServiceOrder.fromJson(response);
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
    await getHomeRes("2024-02-29");

    isload = false;
    update();
    super.onInit();
  }
}
