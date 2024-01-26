import 'package:flutter/material.dart';

import '../styles/styles.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final Widget content;

  const SectionWidget({
    super.key, required this.title, required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppStyles.panelBackgroundColor,
        borderRadius: AppStyles.panelBorderRadius,
      ),
      padding: AppStyles.panelPadding,
      child: Column(
        children: [
          Text(
            title,
            style: AppStyles.panelTitle,
          ),
          AppStyles.verticalSeparator,
          content,
        ],
      ),
    );
  }
}
