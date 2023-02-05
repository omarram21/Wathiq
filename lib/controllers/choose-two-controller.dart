import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:wathiq/models/accidents.dart';
import 'package:wathiq/views/navbar/wathiq/choosing/wating-page.dart';
import 'package:wathiq/views/navbar/wathiq/required/required-details.dart';

class ChooseTwoControllers extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await _determinePosition();

    ever(
      randomNumber,
      (callback) {
        print(callback.toString() + " ever");
        Listen(callback);
      },
    );
  }

  RxBool isdone = false.obs;
  RxInt numOfCars = 2.obs;

  late final position;
  late GeoPoint geoPoint;

  RxInt randomNumber = 0.obs;
  RxInt listSize = 0.obs;

  RxBool go = false.obs;

  void incresining() {
    numOfCars.value++;
  }

  void decresining() {
    numOfCars.value--;
  }

  void offToFill(String docName) async {
    final doc = await FirebaseFirestore.instance
        .collection('accidents')
        .doc(docName)
        .get();
    if (doc.exists) {
      final accidents = Accidents.fromSnap(doc);
      go.value = accidents.noOfCars == accidents.users.length;
    } else {
      print("No Such Doc List");
    }
  }

  void addOneUser(String douc) {
    // print(douc);
    // print(douc.contains("wathiq"));
    // print("===============================================================");
    if (douc.contains("wathiq")) {
      randomNumber.value = int.parse(douc.substring(6));
      FirebaseFirestore.instance
          .collection("accidents")
          .doc(randomNumber.toString())
          .update({
        "users": FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
      });
      Get.to(() => WaitingPage());
    } else {
      print("Not Wathiq QR");
    }
  }

  void Listen(int rand) async {
    try {
      print(rand.toString() + " Inside Listen");
      print(rand != 0);

      if (rand != 0) {
        print(rand.toString() + " Inside Listen");
        print("${rand} insiiiiiidiieidiediedieidiedi");

        await FirebaseFirestore.instance
            .collection("accidents")
            .doc(randomNumber.toString())
            .snapshots()
            .listen((event) {
          print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
          print(event);
          Accidents accidents = Accidents.fromSnap(event);
          print(accidents.noOfCars);
          print(accidents.users.length);
          if (accidents.noOfCars == accidents.users.length)
            Future.delayed(Duration(seconds: 1), () {
              Get.off(() => RequiredDetails(),
                  arguments: randomNumber.toString());
            });
          // print(accidents.noOfCars);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void makeTheColliction() async {
    Accidents accidents = Accidents(
        noOfCars: numOfCars.value,
        users: [FirebaseAuth.instance.currentUser!.uid],
        location: geoPoint);
    try {
      await FirebaseFirestore.instance
          .collection("accidents")
          .doc(randomNumber.toString())
          .set(accidents.toJson());
      // .doc(randomNumber.toString()).;
    } catch (e) {
      print(e);
    }
  }

  void checkForDocuments() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("accidents")
          .doc(randomNumber.toString())
          .delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't Continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        // return Future.error('Location permissions are denied');
        print('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // return Future.error(
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // Continue accessing the position of the device.
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    isdone.value = true;

    print(position.latitude);
    print(position.longitude);
    geoPoint = GeoPoint(position.latitude, position.longitude);
    geoPoint = GeoPoint(30, 30);
  }
}
