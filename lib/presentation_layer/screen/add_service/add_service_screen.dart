import 'package:animal_app_dashboard/application_layer/ShardFunction/valid.dart';
import 'package:animal_app_dashboard/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:animal_app_dashboard/presentation_layer/components/appbar1.dart';
import 'package:animal_app_dashboard/presentation_layer/components/customtextfild.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/color_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/font_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class AddService extends StatelessWidget {
  const AddService({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('اضافة منتج'),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: deviceInfo.localWidth * 0.87,
                    height: 190,
                    decoration: BoxDecoration(
                      color: const Color(0xffF0F0F0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/image 1.png'),
                        Text(
                          'اختار صوره',
                          style: MangeStyles().getBoldStyle(
                            color: ColorManager.kPrimary,
                            fontSize: FontSize.s20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomTextfeild(
                    text: 'اسم الخدمه اللغه العربيه',
                    valid: (p0) {},
                    onsaved: (p0) {},
                    titel: 'اسم الخدمه',
                    width: deviceInfo.localWidth * 0.05,
                    height: 60,
                    fillColor: const Color(0xffF0F0F0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfeild(
                    text: 'اسم الخدمه اللغه الانجليزيه',
                    valid: (p0) {},
                    onsaved: (p0) {},
                    titel: 'اسم الخدمه',
                    width: deviceInfo.localWidth * 0.05,
                    height: 60,
                    fillColor: const Color(0xffF0F0F0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceInfo.localWidth * 0.05),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'اكتب الوصف اللغه العربيه',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary,
                          fontSize: FontSize.s18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceInfo.localWidth * 0.05, vertical: 5),
                    child: TextFormField(
                      onSaved: (newValue) {}, validator: (value) {},
                      maxLines: 8, // Set to null to allow unlimited lines
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffF0F0F0),
                        hintText: 'اكتب الوصف اللغه العربيه',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17),
                          borderSide: BorderSide(
                            width: 0,
                            // style: BorderStyle.none,
                            color: ColorManager.grey2,
                          ), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17),
                          borderSide: BorderSide(
                            width: 1.2,
                            // style: BorderStyle.none,
                            color: ColorManager.grey2,
                          ), //<-- SEE HERE
                        ),
                        filled: true,
                        hintStyle: MangeStyles().getLightStyle(
                          color: ColorManager.ktextblackk,
                          fontSize: FontSize.s18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceInfo.localWidth * 0.05),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'اكتب الوصف اللغه الانجليزيه',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary,
                          fontSize: FontSize.s18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceInfo.localWidth * 0.05, vertical: 5),
                    child: TextFormField(
                      onSaved: (newValue) {}, validator: (value) {},
                      maxLines: 8, // Set to null to allow unlimited lines
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffF0F0F0),
                        hintText: 'اكتب الوصف',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17),
                          borderSide: BorderSide(
                            width: 0,
                            // style: BorderStyle.none,
                            color: ColorManager.grey2,
                          ), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17),
                          borderSide: BorderSide(
                            width: 1.2,
                            // style: BorderStyle.none,
                            color: ColorManager.grey2,
                          ), //<-- SEE HERE
                        ),
                        filled: true,
                        hintStyle: MangeStyles().getLightStyle(
                          color: ColorManager.ktextblackk,
                          fontSize: FontSize.s18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfeild(
                    text: 'سعر الخدمه',
                    valid: (p0) {},
                    onsaved: (p0) {},
                    titel: 'سعر الخدمه',
                    width: deviceInfo.localWidth * 0.05,
                    height: 60,
                    fillColor: const Color(0xffF0F0F0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
