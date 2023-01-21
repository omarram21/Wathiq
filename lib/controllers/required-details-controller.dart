import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sn_progress_dialog/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:wathiq/views/navbar/navbar.dart';
import 'package:wathiq/views/navbar/wathiq/wathiq.dart';

class RequiredDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();

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

  String? PlateNumber1;
  String? PlateNumber2;
  RxString plateNumberAll = "".obs;

  RxString license = "".obs;
  RxString responsible = "".obs;
  bool okay = false;
  RxList chickList = [].obs;

  RxList<dynamic> listImage = [].obs;
  RxList<dynamic> listImage2 = [].obs;
  List after1 = [];
  List after2 = [];

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

  Future<bool> sentAccidentReport(
      String accidentNum, BuildContext context) async {
    ProgressDialog pd = ProgressDialog(context: context);
    try {
      if (!plateNumberAll.value.isEmpty &&
          !license.value.isEmpty &&
          !responsible.value.isEmpty &&
          okImages.value == true &&
          !audioDuration.value.isEmpty) {
        pd.show(
          max: 100,
          msg: 'Uploading...',
          // completed: Completed(completedMsg: "Complete", completionDelay: 1500),
          progressBgColor: Colors.transparent,
        );

        // for (int i = 1; i <= 100; i++) {
        //   pd.update(value: i);
        //   await Future.delayed(Duration(milliseconds: 10));
        // }
        pd.update(value: 0);
        // await Future.delayed(Duration(seconds: 2));

        String afterAudio = await upladeVoice();
        print(afterAudio);
        pd.update(value: 25);

        after1 = await upladeImages();
        print(after1);

        pd.update(value: 50);

        after2 = await upladeImages2();
        print(after2);

        pd.update(value: 90);

        FirebaseFirestore.instance
            .collection('accidents')
            .doc(accidentNum)
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'plateNumberAll': plateNumberAll.value,
          'license': license.value,
          'responsible': responsible.value,
          'chickList': chickList.value,
          'after': afterAudio,
          'listImage': after1,
          'listImage2': after2,
        });
        await Future.delayed(Duration(milliseconds: 1000));
        pd.update(value: 100);
        pd.close();
        print(pd.isOpen());

        await Future.delayed(Duration(seconds: 1));

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      pd.close();
      return false;
    }
  }

  Future<String> upladeVoice() async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('voice/${DateTime.now()}${audio!.path.split('/').last}');
    print(audio);
    UploadTask uploadTask = storageRef.putFile(audio!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    print(downloadUrl);

    return downloadUrl;
  }

  Future<List> upladeImages() async {
    List after = [];
    for (int i = 0; i < listImage.length; i++) {
      final storageRef = FirebaseStorage.instance.ref().child(
          'images/${DateTime.now()}${listImage[i].path.split('/').last}');
      UploadTask uploadTask = storageRef.putFile(listImage[i]);
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      after.add(downloadUrl);
    }
    return after;
  }

  Future<List> upladeImages2() async {
    List after = [];
    for (int i = 0; i < listImage2.length; i++) {
      final storageRef = FirebaseStorage.instance.ref().child(
          'images/${DateTime.now()}${listImage2[i].path.split('/').last}');
      UploadTask uploadTask = storageRef.putFile(listImage2[i]);
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      after.add(downloadUrl);
    }
    return after;
  }

  // _completedProgress(context) async {}
}
