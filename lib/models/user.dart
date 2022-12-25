import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String nationalNumber;
  String IDno;
  String name;
  String uid;
  String phone;

  Users(
      {required this.name,
      required this.nationalNumber,
      required this.uid,
      required this.IDno,
      this.phone = ''});

  Map<String, dynamic> toJson() => {
        "name": name,
        "IDno": IDno,
        "nationalNumber": nationalNumber,
        "uid": uid,
        "phone": phone,
      };

  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Users(
      nationalNumber: snapshot['nationalNumber'],
      IDno: snapshot['IDno'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      phone: snapshot['phone'],
    );
  }
}
