import 'package:flutter/material.dart';

import '../styles/styles.dart';

class ItemWidget extends StatefulWidget {
  final String id;
  final String title;
  final String? subtitle;
  final Function(String) itemSelected;
  final Function(String) itemUnselected;
  final VoidCallback onTap;

  const ItemWidget(
      {super.key,
      required this.id,
      required this.title,
      this.subtitle,
      required this.itemSelected,
      required this.itemUnselected,
      required this.onTap});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isSelected
            ? ItemManagerStyles.selectedItemBorder
            : ItemManagerStyles.itemBorder,
        borderRadius: ItemManagerStyles.itemBorderRadius,
        color:
            isSelected ? ItemManagerStyles.selectedItemBackgroundColor : null,
      ),
      child: ListTile(
        leading: Checkbox(
          activeColor: ItemManagerStyles.itemCheckboxColor,
          value: isSelected,
          onChanged: (bool? isChecked) {
            setState(() {
              isSelected = isChecked!;
            });
            if (isChecked!) {
              widget.itemSelected(widget.id);
            } else {
              widget.itemUnselected(widget.id);
            }
          },
        ),
        title: Text(widget.title),
        subtitle: (widget.subtitle == null) ? null : Text(widget.subtitle!),
        onTap: widget.onTap,
      ),
    );
  }
}
