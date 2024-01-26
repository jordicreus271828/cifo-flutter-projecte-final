import 'package:compulsilina/model/exercise.dart';
import 'package:compulsilina/widgets/page_widget.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';
import '../development.dart';
import '../styles/styles.dart';
import '../widgets/custom_error_widget.dart';
import '../widgets/loading_widget.dart';

class EditExercisePage extends StatefulWidget {
  final String challengeId;
  final String exerciseId;

  const EditExercisePage(
      {super.key, required this.challengeId, required this.exerciseId});

  @override
  State<EditExercisePage> createState() => _EditExercisePageState();
}

class _EditExercisePageState extends State<EditExercisePage> {
  late final Future<Exercise?> futureExercise;
  late final Exercise exercise;
  final TextEditingController nameController = TextEditingController();
  bool nameIsEmpty = false;
  final TextEditingController detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureExercise = _getFutureExercise();
  }

  Future<Exercise?> _getFutureExercise() async {
    Exercise? exercise =
        await Database().getExercise(widget.challengeId, widget.exerciseId);
    if (exercise != null) {
      this.exercise = exercise;
      nameController.text = exercise.name;
      detailsController.text = exercise.details;
    }
    return exercise;
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: "Editar ejercicio",
      body: _futureBuilder(),
    );
  }

  FutureBuilder<Exercise?> _futureBuilder() {
    return FutureBuilder(
      future: futureExercise,
      builder: (BuildContext context, AsyncSnapshot<Exercise?> snapshot) {
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
            const Text("Detalles"),
            TextField(
              // maxLines: 3,
              controller: detailsController,
              maxLength: 500,
            ),
            AppStyles.verticalSeparator,
            const Text("Frecuencia"),
            _frequency(),
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

  Table _frequency() {
    List<String> daysOfTheWeek = [
      "Lunes",
      "Martes",
      "Miércoles",
      "Jueves",
      "Viernes",
      "Sábado",
      "Domingo",
    ];
    List<Widget> widgets = [];

    for (int i = 0; i < 7; i++) {
      Widget widget = _dayOfTheWeek(daysOfTheWeek, i);
      widgets.add(widget);
    }

    return Table(
      // border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(
          children: widgets,
        ),
      ],
    );
  }

  Column _dayOfTheWeek(List<String> daysOfTheWeek, int i) {
    return Column(
      children: [
        Checkbox(
          value: exercise.frequency[i],
          onChanged: (bool? isChecked) {
            setState(() {
              exercise.frequency[i] = isChecked!;
            });
          },
        ),
        Text(
          daysOfTheWeek[i],
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
