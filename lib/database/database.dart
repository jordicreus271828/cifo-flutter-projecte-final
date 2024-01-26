import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compulsilina/model/challenge.dart';
import 'package:compulsilina/model/exercise.dart';
import 'package:flutter/material.dart';

import '../model/hierarchy.dart';

class Database {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Hierarchy>> getHierarchies() async {
    List<Hierarchy> hierarchies = [];

    final querySnapshot = await db
        .collection("users")
        .doc("development")
        .collection("hierarchies")
        .get();
    for (var docSnapshot in querySnapshot.docs) {
      debugPrint('${docSnapshot.id} => ${docSnapshot.data()}');
      Hierarchy hierarchy = Hierarchy.fromFirestore(docSnapshot, null);
      hierarchies.add(hierarchy);
    }

    return hierarchies;
  }

  Future<List<Challenge>> getChallenges() async {
    List<Challenge> challenges = [];

    final querySnapshot = await db
        .collection("users")
        .doc("development")
        .collection("challenges")
        .get();
    for (var docSnapshot in querySnapshot.docs) {
      debugPrint('${docSnapshot.id} => ${docSnapshot.data()}');
      Challenge challenge = Challenge.fromFirestore(docSnapshot, null);
      challenges.add(challenge);
    }

    return challenges;
  }

  Future<Challenge?> getChallenge(String challengeId) async {
    final ref = db
        .collection("users")
        .doc("development")
        .collection("challenges")
        .doc(challengeId)
        .withConverter(
          fromFirestore: Challenge.fromFirestore,
          toFirestore: (Challenge challenge, _) => challenge.toFirestore(),
        );
    final docSnap = await ref.get();
    final challenge = docSnap.data();
    if(challenge != null) {
      debugPrint(challenge.toString());
      List<Exercise> exercises = await _getExercises(challengeId);
      challenge.exercises = exercises;
    } else {
      debugPrint("No such document.");
    }
    return challenge;
  }

  Future<List<Exercise>> _getExercises(String challengeId) async {
    List<Exercise> exercises = [];

    final querySnapshot = await db
        .collection("users")
        .doc("development")
        .collection("challenges")
        .doc(challengeId)
        .collection("exercises")
        .get();
    for (var docSnapshot in querySnapshot.docs) {
      debugPrint('${docSnapshot.id} => ${docSnapshot.data()}');
      Exercise exercise = Exercise.fromFirestore(docSnapshot, null);
      exercises.add(exercise);
    }

    return exercises;
  }

  Future<Exercise?> getExercise(String challengeId, String exerciseId) async {
    final ref = db
        .collection("users")
        .doc("development")
        .collection("challenges")
        .doc(challengeId)
        .collection("exercises")
        .doc(exerciseId)
        .withConverter(
      fromFirestore: Exercise.fromFirestore,
      toFirestore: (Exercise exercise, _) => exercise.toFirestore(),
    );
    final docSnap = await ref.get();
    final exercise = docSnap.data();
    if(exercise != null) {
      debugPrint(exercise.toString());
    } else {
      debugPrint("No such document.");
    }
    return exercise;
  }
}
