import 'package:compulsilina/widgets/page_widget.dart';
import 'package:flutter/material.dart';

class DevelopmentPage1 extends StatelessWidget {
  const DevelopmentPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: "Development 1",
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: const [
            ListTile(
              title: Text("Title 1"),
              subtitle: Text("Subtitle 1"),
            ),
            ListTile(
              title: Text("Title 2"),
              subtitle: Text("Subtitle 2"),
            ),
          ],
        ),
      ),
    );
  }
}
