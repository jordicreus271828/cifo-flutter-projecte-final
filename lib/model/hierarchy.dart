import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compulsilina/model/item.dart';
import 'package:compulsilina/tools/extensions.dart';

class Hierarchy {
  final String id;
  final DateTime created;

  Hierarchy({required this.id, required this.created});

  factory Hierarchy.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Hierarchy(
      id: snapshot.id,
      created: data?['created'].toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "created": Timestamp.fromDate(created),
    };
  }

  Item toItem() {
    return Item(
      id: id,
      title: created.toFullDateString().toSentenceCase(),
    );
  }
}
