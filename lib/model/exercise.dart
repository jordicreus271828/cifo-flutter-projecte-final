import 'package:cloud_firestore/cloud_firestore.dart';

import 'item.dart';

class Exercise {
  final String id;
  final String name;
  final String details;
  final List<bool> frequency;

  Exercise(
      {required this.id,
      required this.name,
      required this.details,
      required this.frequency});

  factory Exercise.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Exercise(
      id: snapshot.id,
      name: data?['name'],
      details: data?['details'],
      frequency: List.from(data?['frequency']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "details": details,
      "frequency": frequency,
    };
  }

  Item toItem() {
    return Item(
      id: id,
      title: name,
      subtitle: details,
    );
  }
}
