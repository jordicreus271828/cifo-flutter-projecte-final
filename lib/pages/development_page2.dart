import 'package:compulsilina/widgets/page_widget.dart';
import 'package:flutter/material.dart';

class DevelopmentPage2 extends StatelessWidget {
  const DevelopmentPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: "Development 2",
      body: Column(
        children: [
          const Column(
            children: [
              ListTile(
                title: Text("Title 1"),
                subtitle: Text("Subtitle 1"),
                selected: true,
                selectedTileColor: Colors.blue,
                selectedColor: Colors.white,
              ),
              ListTile(
                title: Text("Title 2"),
                subtitle: Text("Subtitle 2"),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Container(
            color: Colors.white,
            /*decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),*/
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              children: [
                ListTile(
                  title: Text("Title 1"),
                  subtitle: Text("Subtitle 1"),
                  selected: true,
                  selectedTileColor: Colors.blue,
                  selectedColor: Colors.white,
                ),
                ListTile(
                  title: Text("Title 2"),
                  subtitle: Text("Subtitle 2"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
