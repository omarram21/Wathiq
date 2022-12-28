import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:wathiq/models/user.dart';
import 'package:wathiq/views/authentication/register/password.dart';
import 'package:wathiq/views/navbar/navbar.dart';

class RegisterController extends GetxController {
  String? NID;
  String? Password1;
  String? IDno;
  RxString verificationId = ''.obs;
  String phono = '';

  late Users users;

  void verifyPhone(String phoneNo) async {
    phono = phoneNo;
    print(phono);
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: Duration(seconds: 40),
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) {
        // FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar("Error", e.toString(), duration: Duration(minutes: 1));
      },
      codeSent: (String id, int? resendToken) {
        this.verificationId.value = id;
        print("Value $id");
      },
      codeAutoRetrievalTimeout: (String id) {
        this.verificationId.value = id;
      },
    );
    print('${this.verificationId.value} hererer ');
  }

  verifyOTP(String otp) async {
    // print('${otp} my otp');
    // print('${verificationId.value.isBlank} my sms');
    final x = await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));

    if (x.user != null) {
      Get.to(() => Password());
      FirebaseAuth.instance.currentUser!.delete();
    } else {
      Get.snackbar("SMS not The Same", "Error");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getUser(String n, String id) async {
    final x = await FirebaseFirestore.instance
        .collection('government')
        .where('nationalNumber', isEqualTo: n)
        .where('IDNo', isEqualTo: id)
        .get()
        .then((value) => value.docs.forEach((element) {
              users = Users.fromSnap(element);
            }));

    // print(element.data());
    // print(element.data()['nationalNumber']);
    // print(element.data()['IDNo']);
    // print(element.data()['uid'] ?? '');
    // print(element.data()['name']);
    // print(element.data()['licenseNumber']);
    // print(element.data()['licenseEndDate']);
    // print(element.data()['phone']);

    print(users.toJson());
    print("-----------------------------------------------------");
  }

  void CreateAccount(String nationalID, String password) async {
    bool ok = true;
    try {
      getUser(nationalID, IDno!);
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: nationalID + '@wathiq.com',
        password: password,
      );
      print(credential.user!.uid);
      print(phono);
      users.uid = credential.user!.uid;
      users.phone = phono;
      FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(users.toJson());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar("Something Error", "The account already exists.");
      }
      ok = false;
    } catch (e) {
      Get.snackbar("Something Error", "$e");
      ok = false;
    }
    ok ? Get.offAll(() => NavBar()) : ok;
  }

  void SignIn(String nationalID, String password) async {
    bool ok = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: nationalID + '@wathiq.com',
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ok = false;
        Get.snackbar(
            "Something Error", "No user found for the National Number");
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ok = false;
        Get.snackbar(
            "Something Error", "Wrong password provided for that user.");
      }
    }
    ok ? Get.offAll(() => NavBar()) : ok;
  }

  Future<bool> findNID(String nationalNumber) async {
    bool ok = false;
    await FirebaseFirestore.instance
        .collection('government')
        .where('nationalNumber', isEqualTo: nationalNumber)
        .limit(1)
        .get()
        .then((value) {
      if (value.size == 0) {
        print('No Data');
        ok = false;
      } else {
        print('Data');
        ok = true;
      }
    });
    return ok;
    print("------------${nationalNumber}--------------");
  }

  Future<bool> findIDno(String IDnoo) async {
    bool ok = false;
    // print(NID);
    // print(IDnoo);
    await FirebaseFirestore.instance
        .collection('government')
        .where('nationalNumber', isEqualTo: NID)
        .where('IDNo', isEqualTo: IDnoo)
        .limit(1)
        .get()
        .then((value) {
      if (value.size == 0) {
        print('No Data');
        ok = false;
      } else {
        print('Data');
        ok = true;
      }
    });
    return ok;
    print("------------${IDnoo}--------------");
  }

  void SignOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
