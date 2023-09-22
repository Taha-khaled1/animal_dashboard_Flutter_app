import 'dart:convert';
import 'dart:io';

import 'package:animal_app_dashboard/application_layer/ShardFunction/valid.dart';
import 'package:animal_app_dashboard/main.dart';
import 'package:animal_app_dashboard/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:animal_app_dashboard/presentation_layer/components/appbar1.dart';
import 'package:animal_app_dashboard/presentation_layer/components/custombutten.dart';
import 'package:animal_app_dashboard/presentation_layer/components/customtextfild.dart';
import 'package:animal_app_dashboard/presentation_layer/components/show_dialog.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/color_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/font_manager.dart';
import 'package:animal_app_dashboard/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

class AddService extends StatefulWidget {
  const AddService({Key? key}) : super(key: key);

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  String? name, nameen, des, desen, price;
  bool isload = false;
  final _formKey = GlobalKey<FormState>();

  XFile? pickedImage;

// Function to pick an image
  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery); // You can also use ImageSource.camera

    if (pickedFile != null) {
      setState(() {
        pickedImage = pickedFile;
      });
    }
  }

  Future<bool> registerUser() async {
    isload = true;
    setState(() {});

    final String url = 'https://elegantae.net/api/vendor-account/service';

    // Create a new multipart request
    final request = http.MultipartRequest('POST', Uri.parse(url));

    // Add headers to the request
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] =
        'Bearer ${sharedPreferences.getString('token')}';

    // Add fields to the request
    request.fields['title_ar'] = name!;
    request.fields['title_en'] = nameen!;
    request.fields['description_ar'] = des!;
    request.fields['description_en'] = desen!;
    request.fields['price'] = price!;

    // Attach the picked image file to the request if available
    if (pickedImage != null) {
      final file = await http.MultipartFile.fromPath(
        'image',
        pickedImage!.path,
        contentType: MediaType(
            'image', 'jpeg'), // You can adjust the content type as needed
      );
      request.files.add(file);
    }

    // Send the request
    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('doneeee');
      final data = jsonDecode(await response.stream.bytesToString())['data'];
      return true;
    } else {
      print('Registration failed with status: ${response.statusCode}.');
      print('Error body: ${await response.stream.bytesToString()}.');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('اضافة منتج'),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
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
                            pickedImage != null
                                ? Image.file(File(pickedImage!
                                    .path)) // Display the picked image
                                : Image.asset(
                                    'assets/icons/image 1.png'), // Default image or a placeholder
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
                    ),
                    CustomTextfeild(
                      text: 'اسم الخدمه اللغه العربيه',
                      valid: (value) {
                        name = value.toString();
                      },
                      onsaved: (value) {
                        return validInput(value.toString(), 3, 100, "type");
                      },
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
                      valid: (value) {
                        return validInput(value.toString(), 3, 100, "type");
                      },
                      onsaved: (value) {
                        nameen = value.toString();
                      },
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
                          horizontal: deviceInfo.localWidth * 0.05,
                          vertical: 5),
                      child: TextFormField(
                        onSaved: (newValue) {
                          des = newValue.toString();
                        },
                        validator: (value) {
                          return validInput(value.toString(), 3, 500, "type");
                        },
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
                          horizontal: deviceInfo.localWidth * 0.05,
                          vertical: 5),
                      child: TextFormField(
                        onSaved: (newValue) {
                          desen = newValue.toString();
                        },
                        validator: (value) {
                          return validInput(value.toString(), 1, 500, "type");
                        },
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
                      valid: (value) {
                        return validInput(value.toString(), 3, 30, "number");
                      },
                      onsaved: (value) {
                        price = value.toString();
                      },
                      titel: 'سعر الخدمه',
                      width: deviceInfo.localWidth * 0.05,
                      height: 60,
                      fillColor: const Color(0xffF0F0F0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    !isload
                        ? CustomButton(
                            width: double.infinity,
                            haigh: 55,
                            color: ColorManager.kPrimary,
                            text: "حفظ",
                            press: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                bool x = await registerUser();
                                isload = false;
                                setState(() {});
                                if (x) {
                                  showDilog(
                                    context,
                                    barrierDismissible: false,
                                    "تم اضافة الخدمه بنجاح",
                                    onConfirmBtnTap: () {
                                      Get.back();
                                      Get.back();
                                    },
                                  );
                                } else {
                                  showDilog(
                                    context,
                                    barrierDismissible: false,
                                    "لم يتم اضافة الخدمه",
                                    type: QuickAlertType.error,
                                    onConfirmBtnTap: () {
                                      Get.back();
                                      Get.back();
                                    },
                                  );
                                }
                              }
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
