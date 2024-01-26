import 'package:compulsilina/widgets/item_widget.dart';
import 'package:compulsilina/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import '../model/action_button.dart';
import '../model/item.dart';
import '../styles/styles.dart';
import 'custom_error_widget.dart';

class ListWidget extends StatefulWidget {
  final Future<List<Item>> futureItems;
  final Function(String) onTap;
  final ActionButton newButton;
  final ActionButton deleteButton;

  const ListWidget(
      {super.key,
      required this.futureItems,
      required this.onTap,
      required this.newButton,
      required this.deleteButton});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final List<String> selectedItems = [];

  void itemSelected(String itemId) {
    setState(() {
      selectedItems.add(itemId);
    });
  }

  void itemUnselected(String itemId) {
    setState(() {
      selectedItems.remove(itemId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.futureItems,
      builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
        if (snapshot.hasData) {
          List<Item> items = snapshot.data!;
          return _itemManager(items);
        } else if (snapshot.hasError) {
          return CustomErrorWidget(snapshot: snapshot);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  Column _itemManager(List<Item> items) {
    return Column(
      children: [
        _listView(items),
        _actionBar(),
      ],
    );
  }

  Expanded _listView(List<Item> items) {
    return Expanded(
      child: ListView.separated(
        padding: ItemManagerStyles.fullScreenListViewPadding,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          Item item = items[index];
          return ItemWidget(
            id: item.id,
            title: item.title,
            subtitle: item.subtitle,
            itemSelected: itemSelected,
            itemUnselected: itemUnselected,
            onTap: () => widget.onTap(item.id),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            ItemManagerStyles.itemSeparator,
      ),
    );
  }

  Container _actionBar() {
    return Container(
      decoration: ItemManagerStyles.fullScreenActionBarDecoration,
      padding: ItemManagerStyles.actionBarPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Select all
          /*OutlinedButton(
            onPressed: () {},
            child: const Text("Seleccionar todo"),
          ),*/
          // New button
          OutlinedButton(
            onPressed: widget.newButton.onPressed,
            child: Text(widget.newButton.text),
          ),
          // Delete button
          OutlinedButton(
            onPressed:
                (selectedItems.isEmpty) ? null : widget.deleteButton.onPressed,
            child: Text(widget.deleteButton.text),
          ),
        ],
      ),
    );
  }
}
