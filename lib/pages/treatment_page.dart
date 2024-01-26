import 'package:compulsilina/development.dart';
import 'package:compulsilina/pages/challenges_page.dart';
import 'package:compulsilina/pages/hierarchies_page.dart';
import 'package:compulsilina/styles/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/large_button_widget.dart';
import '../tools/custom_navigator.dart';
import '../widgets/page_widget.dart';

class TreatmentPage extends StatelessWidget {
  const TreatmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: "Mi tratamiento",
      body: SingleChildScrollView(
        child: Container(
          margin: AppStyles.bodyMargin,
          child: Column(
            children: [
              const Text(Development.loremIpsum100),
              AppStyles.verticalSeparator,
              LargeButtonWidget(
                onPressed: () => CustomNavigator.push(context, const HierarchiesPage()),
                text: "Jerarquías de síntomas",
              ),
              AppStyles.verticalSeparator,
              LargeButtonWidget(
                onPressed: () => CustomNavigator.push(context, const ChallengesPage()),
                text: "Mis retos",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
