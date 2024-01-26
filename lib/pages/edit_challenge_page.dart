import 'package:compulsilina/database/database.dart';
import 'package:compulsilina/model/challenge.dart';
import 'package:compulsilina/model/exercise.dart';
import 'package:compulsilina/styles/styles.dart';
import 'package:compulsilina/widgets/page_widget.dart';
import 'package:compulsilina/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import '../development.dart';
import '../model/action_button.dart';
import '../model/item.dart';
import '../widgets/custom_error_widget.dart';
import '../widgets/exercise_list_widget.dart';

class EditChallengePage extends StatefulWidget {
  final String challengeId;

  const EditChallengePage({super.key, required this.challengeId});

  @override
  State<EditChallengePage> createState() => _EditChallengePageState();
}

class _EditChallengePageState extends State<EditChallengePage> {
  late final Future<Challenge?> futureChallenge;
  late final Challenge challenge;
  final TextEditingController nameController = TextEditingController();
  bool nameIsEmpty = false;
  final List<Item> items = [];

  @override
  void initState() {
    super.initState();
    futureChallenge = _getFutureChallenge();
  }

  Future<Challenge?> _getFutureChallenge() async {
    Challenge? challenge = await Database().getChallenge(widget.challengeId);
    if (challenge != null) {
      this.challenge = challenge;
      nameController.text = challenge.name;

      for (Exercise exercise in challenge.exercises) {
        Item item = exercise.toItem();
        items.add(item);
      }
    }
    return challenge;
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: "Editar reto",
      body: _futureBuilder(),
    );
  }

  FutureBuilder<Challenge?> _futureBuilder() {
    return FutureBuilder(
      future: futureChallenge,
      builder: (BuildContext context, AsyncSnapshot<Challenge?> snapshot) {
        if (snapshot.hasData) {
          return _body();
        } else if (snapshot.hasError) {
          return CustomErrorWidget(snapshot: snapshot);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Container(
        margin: AppStyles.bodyMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nombre"),
            TextField(
              controller: nameController,
              maxLength: 100,
              onChanged: (inputValue) {
                setState(() {
                  nameIsEmpty = inputValue.isEmpty;
                });
              },
              decoration: InputDecoration(
                errorText: (nameIsEmpty) ? "Introduzca un nombre" : null,
              ),
            ),
            AppStyles.verticalSeparator,
            const Text("Ejercicios de exposición"),
            ExerciseListWidget(
              challenge: challenge,
              newButton: ActionButton(
                text: "Nuevo ejercicio",
                onPressed: () => Development.developmentDialog(context),
              ),
              deleteButton: ActionButton(
                text: "Eliminar",
                onPressed: () => Development.developmentDialog(context),
              ),
            ),
            AppStyles.verticalSeparator,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar"),
                ),
                FilledButton(
                  onPressed: (nameIsEmpty)
                      ? null
                      : () => Development.developmentDialog(context),
                  child: const Text("Guardar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
