import 'package:flutter/material.dart';

import 'model/item.dart';

class Development {
  static const String loremIpsum25 =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sit amet purus vitae felis tincidunt dapibus facilisis et enim. Cras consectetur, magna nec tempor dapibus.";
  static const String loremIpsum50 =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In nec est bibendum, varius nisi at, auctor elit. Maecenas enim dui, volutpat a lorem nec, commodo lobortis tortor. Suspendisse potenti. Pellentesque sit amet pellentesque enim, sit amet elementum mauris. Curabitur et urna quis turpis sagittis euismod id dignissim felis. In rhoncus.";
  static const String loremIpsum100 =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nec dui porttitor, ultrices diam ut, interdum sem. Curabitur commodo est eget orci imperdiet accumsan. In et erat diam. In lobortis malesuada turpis id interdum. Nam id mi eget nisl sagittis maximus. Suspendisse vitae leo posuere nisi iaculis mollis ac sed neque. Vivamus et faucibus metus. Nulla fermentum malesuada neque non venenatis. Cras eleifend volutpat libero commodo feugiat. Integer vel scelerisque nisi. Nullam ac elit lorem. Phasellus ut purus vel enim lobortis posuere in a felis. Quisque efficitur erat nibh, in vestibulum sem fringilla ut. Maecenas tempor ante ut leo egestas.";

  static void developmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Desarrollo"),
          content: const Text("En desarrollo"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  static List<Item> getHierarchyItems() {
    List<Item> items = [];

    items.addAll({
      Item(
        id: "hierarchy1",
        title: "Viernes, 1 de diciembre de 2023",
      ),
    });

    return items;
  }

  static List<Item> getChallengeItems() {
    List<Item> items = [];

    items.addAll({
      Item(
        id: "challenge1",
        title: "Reto 1",
        subtitle: "Domingo, 3 de diciembre de 2023",
      ),
      Item(
        id: "challenge2",
        title: "Reto 2",
        subtitle: "Domingo, 24 de diciembre de 2023",
      ),
      Item(
        id: "challenge3",
        title: "Reto 3",
        subtitle: "Domingo, 14 de enero de 2024",
      ),
      Item(
        id: "challenge4",
        title: "Reto 4",
        subtitle: "Domingo, 4 de febrero de 2024",
      ),
    });

    return items;
  }
}
