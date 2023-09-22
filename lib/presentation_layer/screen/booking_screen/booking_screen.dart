import 'package:animal_app_dashboard/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:animal_app_dashboard/presentation_layer/components/appbar1.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/color_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/font_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/styles_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/screen/booking_screen/booking_controller/booking_controller.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('الحجوزات'),
      body: GetBuilder<BookingController>(
        init: BookingController(),
        builder: (controller) {
          return !controller.isload
              ? Container(
                  alignment: Alignment.topCenter,
                  child: InfoWidget(
                    builder: (context, deviceInfo) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            // Container(
                            //   height: 100,
                            //   width: deviceInfo.localWidth * 0.85,
                            //   child: DatePicker(
                            //     DateTime.now(),
                            //     initialSelectedDate: DateTime.now(),
                            //     selectionColor: ColorManager.kPrimary,
                            //     selectedTextColor: Colors.white,
                            //     onDateChange: (date) {
                            //       // New date selected
                            //       setState(() {
                            //         _selectedValue = date;
                            //       });
                            //       print(_selectedValue);
                            //     },
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.serviceOrder?.data!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: ColorManager.kTextblack,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 2),
                                          color: ColorManager.kTextlightgray,
                                          blurRadius: 4),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Text(
                                          '${controller.serviceOrder?.data![index].totalPrice} AED',
                                          style: MangeStyles().getBoldStyle(
                                            color: ColorManager.white,
                                            fontSize: FontSize.s18,
                                          ),
                                        ),
                                        trailing: Text(
                                          '${controller.serviceOrder?.data![index].user!.name} \n ${controller.serviceOrder?.data![index].user?.number ?? ""}',
                                          style: MangeStyles().getBoldStyle(
                                            color: ColorManager.kPrimary2,
                                            fontSize: FontSize.s18,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'الخدمات',
                                            style: MangeStyles().getBoldStyle(
                                              color: ColorManager.white,
                                              fontSize: FontSize.s18,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 55,
                                        width: 230,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: BoxDecoration(
                                          color: ColorManager.kTextlightgray
                                              .withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          controller.serviceOrder?.data![index]
                                                  .service?.arServiceName ??
                                              "",
                                          style: MangeStyles().getBoldStyle(
                                            color: ColorManager.white,
                                            fontSize: FontSize.s16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'الوقت : ${controller.serviceOrder?.data![index].time ?? ""}',
                                              style: MangeStyles().getBoldStyle(
                                                color: ColorManager.white,
                                                fontSize: FontSize.s18,
                                              ),
                                            ),
                                            Text(
                                              'التاريخ : ${controller.serviceOrder?.data![index].date ?? ""}',
                                              style: MangeStyles().getBoldStyle(
                                                color: ColorManager.white,
                                                fontSize: FontSize.s18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
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

// class BookServiceCard extends StatelessWidget {
//   const BookServiceCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
