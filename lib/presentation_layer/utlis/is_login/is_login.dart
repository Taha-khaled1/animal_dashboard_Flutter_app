import '../../../main.dart';

bool isLogin() {
  print(
      "${sharedPreferences.getInt('id')} : ${sharedPreferences.getString('name')} : ${sharedPreferences.getString('token')}");
  if (sharedPreferences.getInt('id') == null ||
      sharedPreferences.getString('name') == null ||
      sharedPreferences.getString('token') == null) {
    return false;
  }
  return true;
}
