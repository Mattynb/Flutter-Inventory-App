import 'package:flutter/material.dart';
import 'package:inventory_app/model/list_item.dart';

class ListItemWidget extends StatefulWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) => SizeTransition(
        sizeFactor: widget.animation,
        child: buildItem(),
      );

  Widget buildItem() => Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,

        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(widget.item.urlImage),
              backgroundColor: Colors.white54),
          title: Row(children: [
            Text(
              widget.item.title,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const Spacer(),
            Center(
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.remove), onPressed: () => {}),
                  Text(
                    'qty: ${widget.item.amount}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  IconButton(icon: const Icon(Icons.add), onPressed: () => {}), //Todo: on press change amount value
                ],
              ),
            )
          ]),
          trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red, size: 32),
              onPressed: widget.onClicked),
        ),
      );
}
