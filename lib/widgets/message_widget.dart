import 'package:flutter/material.dart';

import '../styles/styles.dart';

class MessageWidget extends StatelessWidget {
  final String text;

  const MessageWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.orange),
        borderRadius: AppStyles.messageBorderRadius,
      ),
      color: Colors.orange[100],
      child: Padding(
        padding: AppStyles.messagePadding,
        child: Text(text),
      ),
    );
  }
}
