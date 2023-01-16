import 'package:cloud_firestore/cloud_firestore.dart';

class Accidents {
  int noOfCars;
  List<dynamic> users;
  GeoPoint location;

  Accidents({
    required this.noOfCars,
    required this.users,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
        "noOfCars": noOfCars,
        "users": users,
        "location": location,
      };

  static Accidents fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Accidents(
      noOfCars: snapshot['noOfCars'],
      users: snapshot['users'],
      location: snapshot['location'],
    );
  }
}
