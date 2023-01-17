import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wathiq/views/navbar/wathiq/wathiq.dart';

class RequiredDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // print(File("assets/images/image.png"));

    // listImage.add(File("assets/images/image.png"));
    listImage.addAll(
      [
        "assets/images/1.png",
        "assets/images/2.png",
        "assets/images/3.png",
        "assets/images/4.png",
      ],
    );

    for (int i = 0; i < 9; i++) {
      listImage2.add("assets/images/damage.png");
    }

    chickList.value = List.filled(17, false);
    print(chickList.value);
  }

  RxString groub = "".obs;

  String? PlateNumber1;
  String? PlateNumber2;
  RxString plateNumberAll = "".obs;

  RxString license = "".obs;
  RxString responsible = "".obs;

  RxList chickList = [].obs;

  RxList<dynamic> listImage = [].obs;
  RxList<dynamic> listImage2 = [].obs;
  RxBool okImages = false.obs;
  final ImagePicker _picker = ImagePicker();

  File? audio;
  RxString audioDuration = ''.obs;

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
    for (int i = 0; i < 9; i++) {
      final image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null)
        return false;
      else {
        listImage2[i] = File(image.path);
      }
    }
  }

  bool checkList1() {
    for (int i = 0; i < 4; i++) {
      if (listImage[i] == "assets/images/${i + 1}.png") return false;
    }
    return true;
  }

  bool checkList2() {
    for (int i = 0; i < 9; i++) {
      if (listImage2[i] == "assets/images/damage.png") return false;
    }
    return true;
  }

  bool checkallList() {
    if (checkList1() && checkList2()) {
      okImages.value = true;
      return true;
    } else {
      Get.snackbar("Error", "Pleas fill all the images");
      return false;
    }
  }

  sentAccidentReport() {
    if (!plateNumberAll.value.isEmpty &&
        !license.value.isEmpty &&
        !responsible.value.isEmpty &&
        !audioDuration.value.isEmpty) {
      FirebaseFirestore.instance
          .collection('accidents')
          .doc('158489')
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'plateNumberAll': plateNumberAll.value,
        'license': license.value,
        'responsible': responsible.value,
        'chickList': chickList.value,
      });
      upladeVoice();
    } else
      print('don\'t');
  }

  upladeVoice() async {
    final storageRef = FirebaseStorage.instance.ref().child('voice/audio.png');
    // final voiceRef = storageRef.child("images/mountains.jpg");
    print(File(listImage[0]));
    UploadTask uploadTask = storageRef.putFile(File(listImage[0]));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    print(downloadUrl);
    // String url = await voiceRef.getDownloadURL();
    // print(url);
  }
}
