import 'package:animal_app_dashboard/presentation_layer/components/navbar.dart';
import 'package:animal_app_dashboard/presentation_layer/screen/auth_screen/login_screen/login_screen.dart';
import 'package:animal_app_dashboard/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:animal_app_dashboard/presentation_layer/utlis/is_login/is_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPage = [
  // GetPage(
  //     name: Routes.welcomRoute,
  //     page: () => const WelcomeScreen(),
  //     middlewares: [
  //       Midelware(),
  //     ]),
  GetPage(name: '/', page: () => LoginScreen(), middlewares: [MyMiddleware()]),
  GetPage(
    name: '/login',
    page: () => LoginScreen(),
  ),
  GetPage(
    name: "/home",
    page: () => Example(),
  ),
  // GetPage(
  //   name: Routes.addproperty,
  //   transition: Transition.fadeIn,
  //   page: () => AddProperty(),
  // ),
// GetPage(
//   name: "/secondPage",
//   transition: Transition.fadeIn,
//   page: SecondPage(),
// ),
// GetPage(
//   name: "/secondPage",
//   transition: Transition.fadeIn,
//   page: SecondPage(),
// ),
];

class MyMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print('Middleware redirect: $route');
    if (isLogin()) {
      // Get.to(() => Example());
      return const RouteSettings(name: 'home');
    } else {
      return const RouteSettings(name: 'login');
    }
  }

  // @override
  // GetPage? onPageCalled(GetPage? page) {
  //   // This method is called before a page is displayed.
  //   // You can modify the page or perform other tasks here.
  //   print('Middleware onPageCalled: ${page?.name}');
  //   return page; // Return the modified page or null to prevent the page from being displayed.
  // }
}
