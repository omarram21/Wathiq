import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:wathiq/models/user.dart';
import 'package:wathiq/views/navbar.dart';

class RegisterController extends GetxController {
  String? NID;
  String? Password;
  String? IDno;
  Future<String> getName() async {
    return await FirebaseFirestore.instance
        .collection('government')
        .where('nationalNumber', isEqualTo: '2000685905')
        .where('IDNo', isEqualTo: 'VXX64965')
        .get()
        .then((value) => value.docs[0]['name']);
  }

  void CreateAccount(String nationalID, String password) async {
    bool ok = true;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: nationalID + '@wathiq.com',
        password: password,
      );

      Users users = Users(
          nationalNumber: nationalID,
          IDno: IDno!,
          name: await getName(),
          uid: credential.user!.uid);
      FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(users.toJson());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar(
            "Something Error", "The account already exists for that email.");
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
