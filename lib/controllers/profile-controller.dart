import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wathiq/models/user.dart';
import 'package:wathiq/views/authentication/choose-method.dart';

class ProfileController extends GetxController {
  late Users users;
  String ComplaintsOrSuggestions = "";
  @override
  void onInit() {
    // TODO: implement onInit
    getName();
  }

  void getName() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      users = Users.fromSnap(value);
      print(users.toJson());
    });
    // print(x);
    // print(users.toJson());
  }

  void deleteAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
    Get.offAll(() => ChooseMethod());
  }

  addToFireeBaseComplaintsOrSuggestions() {
    FirebaseFirestore.instance.collection('ComplaintsOrSuggestions').add({
      "ComplaintsOrSuggestions": ComplaintsOrSuggestions,
      'uid': FirebaseAuth.instance.currentUser!.uid
    });
  }
}
