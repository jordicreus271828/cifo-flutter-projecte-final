import 'package:compulsilina/model/challenge.dart';
import 'package:compulsilina/model/exercise.dart';
import 'package:flutter/material.dart';

import '../model/action_button.dart';
import '../model/item.dart';
import '../pages/edit_exercise_page.dart';
import '../styles/styles.dart';
import '../tools/custom_navigator.dart';
import 'empty_list_widget.dart';
import 'item_widget.dart';

class ExerciseListWidget extends StatefulWidget {
  final Challenge challenge;
  final ActionButton newButton;
  final ActionButton deleteButton;

  const ExerciseListWidget(
      {super.key,
      required this.challenge,
      required this.newButton,
      required this.deleteButton});

  @override
  State<ExerciseListWidget> createState() => _ExerciseListWidgetState();
}

class _ExerciseListWidgetState extends State<ExerciseListWidget> {
  final List<String> selectedExercises = [];

  void exerciseSelected(String exerciseId) {
    setState(() {
      selectedExercises.add(exerciseId);
    });
  }

  void exerciseUnselected(String exerciseId) {
    setState(() {
      selectedExercises.remove(exerciseId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ItemManagerStyles.normalItemManager,
      child: Column(
        children: [
          _listView(),
          _actionBar(),
        ],
      ),
    );
  }

  StatelessWidget _listView() {
    if (widget.challenge.exercises.isEmpty) {
      return const EmptyListWidget();
    } else {
      return Container(
        padding: ItemManagerStyles.normalListViewPadding,
        child: Column(
          children: _listView2(),
        ),
      );
    }
  }

  List<Widget> _listView2() {
    List<Widget> widgets = [];

    // first exercise
    Exercise exercise = widget.challenge.exercises[0];
    Item item = exercise.toItem();
    ItemWidget itemWidget = ItemWidget(
      id: item.id,
      title: item.title,
      subtitle: item.subtitle,
      itemSelected: exerciseSelected,
      itemUnselected: exerciseUnselected,
      onTap: () => CustomNavigator.push(
        context,
        EditExercisePage(
          challengeId: widget.challenge.id,
          exerciseId: item.id,
        ),
      ),
    );
    widgets.add(itemWidget);

    // remaining exercises
    for (int i = 1; i < widget.challenge.exercises.length; i++) {
      Exercise exercise = widget.challenge.exercises[i];
      Item item = exercise.toItem();
      widgets.addAll({
        ItemManagerStyles.itemSeparator,
        ItemWidget(
          id: item.id,
          title: item.title,
          subtitle: item.subtitle,
          itemSelected: exerciseSelected,
          itemUnselected: exerciseUnselected,
          onTap: () => CustomNavigator.push(
            context,
            EditExercisePage(
              challengeId: widget.challenge.id,
              exerciseId: item.id,
            ),
          ),
        ),
      });
    }

    return widgets;
  }

  Container _actionBar() {
    return Container(
      decoration: ItemManagerStyles.normalActionBarDecoration,
      padding: ItemManagerStyles.actionBarPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Select all
          /*OutlinedButton(
            onPressed: () {},
            child: const Text("Seleccionar todo"),
          ),*/
          // New button
          OutlinedButton(
            onPressed: widget.newButton.onPressed,
            child: Text(widget.newButton.text),
          ),
          // Delete button
          OutlinedButton(
            onPressed: (selectedExercises.isEmpty)
                ? null
                : widget.deleteButton.onPressed,
            child: Text(widget.deleteButton.text),
          ),
        ],
      ),
    );
  }
}
