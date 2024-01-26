import 'package:compulsilina/model/action_button.dart';
import 'package:compulsilina/widgets/list_widget.dart';
import 'package:compulsilina/widgets/page_widget.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';
import '../development.dart';
import '../model/challenge.dart';
import '../model/item.dart';
import '../tools/custom_navigator.dart';
import 'edit_challenge_page.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({super.key});

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  late final Future<List<Item>> futureChallengeItems;

  @override
  void initState() {
    super.initState();
    futureChallengeItems = _getFutureChallengeItems();
  }

  Future<List<Item>> _getFutureChallengeItems() async {
    List<Item> items = [];

    List<Challenge> challenges = await Database().getChallenges();
    for (Challenge challenge in challenges) {
      Item item = challenge.toItem();
      items.add(item);
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: "Mis retos",
      body: ListWidget(
        futureItems: futureChallengeItems,
        onTap: (String challengeId) => CustomNavigator.push(
          context,
          EditChallengePage(challengeId: challengeId),
        ),
        newButton: ActionButton(
          text: "Nuevo reto",
          onPressed: () => Development.developmentDialog(context),
        ),
        deleteButton: ActionButton(
          text: "Eliminar",
          onPressed: () => Development.developmentDialog(context),
        ),
      ),
    );
  }
}
