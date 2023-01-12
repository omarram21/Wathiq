import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wathiq/views/navbar/wathiq/wathiq.dart';

class WathiqController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print(File("assets/images/image.png"));
    for (int i = 0; i < 4; i++) {
      // listImage.add(File("assets/images/image.png"));
      listImage.add("assets/images/image.png");
    }
    for (int i = 0; i < 8; i++) {
      listImage2.add("assets/images/image.png");
    }
  }

  RxString groub = "".obs;
  String? PlateNumber1;
  String? PlateNumber2;
  RxString PlateNumberAll = "".obs;

  RxString license = "".obs;
  RxString responsible = "".obs;

  RxList<dynamic> listImage = [].obs;
  RxList<dynamic> listImage2 = [].obs;

  final ImagePicker _picker = ImagePicker();
  pickImage(int indx) async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null)
      return false;
    else {
      listImage[indx] = File(image.path);
    }
  }

  pickAllImage() async {
    for (int i = 0; i < 4; i++) {
      final image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null)
        return false;
      else {
        listImage[i] = File(image.path);
      }
    }
  }

  pickImage2(int indx) async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null)
      return false;
    else {
      listImage2[indx] = File(image.path);
    }
  }

  pickAllImage2() async {
    for (int i = 0; i < 4; i++) {
      final image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null)
        return false;
      else {
        listImage2[i] = File(image.path);
      }
    }
  }
}
