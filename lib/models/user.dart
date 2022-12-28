import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String nationalNumber;
  String IDNo;
  String name;
  String uid;
  String? phone;
  String licenseNumber;
  String licenseEndDate;

  Users(
      {required this.name,
      required this.nationalNumber,
      required this.uid,
      required this.IDNo,
      required this.licenseNumber,
      required this.licenseEndDate,
      this.phone = ''});

  Map<String, dynamic> toJson() => {
        "name": name,
        "IDNo": IDNo,
        "nationalNumber": nationalNumber,
        "uid": uid,
        "licenseNumber": licenseNumber,
        "licenseEndDate": licenseEndDate,
        "phone": phone,
      };

  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Users(
      nationalNumber: snapshot['nationalNumber'],
      IDNo: snapshot['IDNo'],
      uid: snapshot['uid'] ?? 'h',
      name: snapshot['name'],
      licenseNumber: snapshot['licenseNumber'],
      licenseEndDate: snapshot['licenseEndDate'],
      phone: snapshot['phone'],
    );
    // print(snapshot['phone']);
  }
}
