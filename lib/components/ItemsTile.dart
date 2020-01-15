import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:sending_location/components/TextCard.dart';

class ItemsTile extends StatelessWidget {

  ItemsTile(this._icon, this._color, this._items);

  final Iterable<Item> _items;
  final IconData _icon;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _items.map((i) =>
          TextCard(_icon,_color,i.value)
      ).toList(),
    );
  }
}