import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final String title;
  final Widget body;

  const PageWidget({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          // style: Styles.appBarTitle,
        ),
      ),
      body: body,
    );
  }
}
