import 'package:animal_app_dashboard/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:animal_app_dashboard/presentation_layer/components/appbar1.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/color_manager.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('اضافة منتج'),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            child: SingleChildScrollView(
              child: Column(),
            ),
          );
        },
      ),
    );
  }
}
