import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compulsilina/model/item.dart';
import 'package:compulsilina/tools/extensions.dart';

import 'exercise.dart';

class Challenge {
  final String id;
  final String name;
  final DateTime created;
  late final List<Exercise> exercises;

  Challenge({required this.id, required this.name, required this.created});

  factory Challenge.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Challenge(
      id: snapshot.id,
      name: data?['name'],
      created: data?['created'].toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "created": Timestamp.fromDate(created),
    };
  }

  Item toItem() {
    return Item(
      id: id,
      title: name,
      subtitle: created.toFullDateString().toSentenceCase(),
    );
  }
}
