import 'package:compulsilina/widgets/page_widget.dart';
import 'package:flutter/material.dart';

class DevelopmentPage3 extends StatelessWidget {
  const DevelopmentPage3({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<String> items = List<String>.generate(10000, (i) => '$i');
    /*final List<String> items = [
      "aaa",
      "bbb",
      "ccc",
    ];*/
    return PageWidget(
      title: "Development 3",
      body: Column(
        children: [
          Expanded(
            /*child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xff764abc),
                    child: Text(items[index]),
                  ),
                  title: Text('Item ${items[index]}'),
                  subtitle: const Text('Item description'),
                  trailing: const Icon(Icons.more_vert),
                );
              },
            ),*/
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.car_rental),
                  title: Text('Car'),
                  trailing: Icon(Icons.more_vert),
                ),
                ListTile(
                  leading: Icon(Icons.flight),
                  title: Text('Flight'),
                  trailing: Icon(Icons.more_vert),
                ),
                ListTile(
                  leading: Icon(Icons.train),
                  title: Text('Train'),
                  trailing: Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.green[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Button 1"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Button 2"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
