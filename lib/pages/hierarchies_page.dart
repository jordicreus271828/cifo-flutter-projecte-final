import 'package:compulsilina/widgets/list_widget.dart';
import 'package:compulsilina/widgets/page_widget.dart';
import 'package:flutter/material.dart';

import '../database/database.dart';
import '../development.dart';
import '../model/hierarchy.dart';
import '../model/action_button.dart';
import '../model/item.dart';

class HierarchiesPage extends StatefulWidget {
  const HierarchiesPage({super.key});

  @override
  State<HierarchiesPage> createState() => _HierarchiesPageState();
}

class _HierarchiesPageState extends State<HierarchiesPage> {
  late final Future<List<Item>> futureHierarchyItems;

  @override
  void initState() {
    super.initState();
    futureHierarchyItems = _getFutureHierarchyItems();
  }

  Future<List<Item>> _getFutureHierarchyItems() async {
    List<Item> items = [];

    List<Hierarchy> hierarchies = await Database().getHierarchies();
    for (Hierarchy hierarchy in hierarchies) {
      Item item = hierarchy.toItem();
      items.add(item);
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: "Jerarquías de síntomas",
      body: ListWidget(
        futureItems: futureHierarchyItems,
        onTap: (String hierarchyId) => Development.developmentDialog(context),
        newButton: ActionButton(
          text: "Nueva jerarquía",
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
