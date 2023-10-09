import 'package:animal_app_dashboard/data_layer/database/connectdatabase.dart';

dynamic getHome(String data) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    "https://elegantae.net/api/vendor-account/service-order?service_date=${data}",
    myheadersres: curd.myheadersfail,
  );
  print("+++++++++++++++++++");
  print("++++++++++++$respons+++++++");
  return respons;
}

dynamic getStaticHome() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    "https://elegantae.net/api/vendor-account/statistics",
    myheadersres: curd.myheadersfail,
  );
  print("+++++++++++++++++++");
  print("++++++++++++$respons+++++++");
  return respons;
}
