import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ayo_zakat/Model/history.dart';

class HistoryProvider {
  static Stream<List<History>> fetchAll() {
    return FirebaseFirestore.instance.collection('history').snapshots().map(
        (list) => list.docs.map((doc) => History.fromFireStore(doc)).toList());
  }
}
