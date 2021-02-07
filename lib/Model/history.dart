import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  final String id;
  final String name;
  final String image;
  final double nominal;
  final String status;

  History({
    this.id,
    this.name,
    this.image,
    this.nominal,
    this.status,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      nominal: json['nominal'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'nominal': nominal,
        'status': status,
      };

  factory History.fromFireStore(DocumentSnapshot doc) {
    return History(
      id: doc['id'],
      name: doc['name'],
      image: doc['image'],
      nominal: doc['qty'],
      status: doc['status'],
    );
  }
}
