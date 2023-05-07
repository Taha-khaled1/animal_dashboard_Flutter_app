import 'package:animal_app_dashboard/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:animal_app_dashboard/presentation_layer/components/appbar1.dart';
import 'package:animal_app_dashboard/presentation_layer/components/custombutten.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/color_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/font_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/styles_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/screen/account_screen/widget/customListtile.dart';
import 'package:animal_app_dashboard/presentation_layer/screen/add_product/add_product_screen.dart';
import 'package:animal_app_dashboard/presentation_layer/screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:animal_app_dashboard/presentation_layer/screen/screenseting/aboutpage.dart';
import 'package:animal_app_dashboard/presentation_layer/screen/screenseting/sharescreen.dart';
import 'package:animal_app_dashboard/presentation_layer/screen/screenseting/terms.dart';

import 'package:animal_app_dashboard/presentation_layer/support_screen/support_problem_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('معلومات الحساب'),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Text(
                    'الحساب',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.ktextblackk,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
                CustomListtile(
                  widget: const Icon(Icons.person),
                  titel: 'معلومات الحساب',
                  onTap: () {
                    Get.to(() => const EditProfileScreen());
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.add),
                  titel: 'اضافة منتج',
                  onTap: () {
                    Get.to(() => const AddProduct());
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.add),
                  titel: 'اضافة خدمة',
                  onTap: () {
                    Get.to(const EditProfileScreen());
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.privacy_tip_outlined),
                  titel: 'سياسة الخصوصيه',
                  onTap: () {
                    // Get.to(page);
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.policy_outlined),
                  titel: 'شروط والاحكام',
                  onTap: () {
                    Get.to(() => TermsAndConditionsPage());
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.share),
                  titel: 'مشاركة التطبيق',
                  onTap: () {
                    Get.to(() => const ShareApp());
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Text(
                    'المساعده',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.ktextblackk,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
                CustomListtile(
                  widget: const Icon(Icons.call),
                  titel: 'تواصل معنا',
                  onTap: () {
                    Get.to(
                      () => const SupportProblemScreen(),
                    );
                  },
                ),
                CustomListtile(
                  widget: const Icon(Icons.info_outline),
                  titel: 'معلومات عنا',
                  onTap: () {
                    Get.to(() => const AboutPage());
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceInfo.localWidth * 0.1),
                  child: CustomButton(
                    width: deviceInfo.localWidth * 0.8,
                    haigh: 60,
                    color: ColorManager.kPrimary,
                    text: 'تسجيل الخروج',
                    press: () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
