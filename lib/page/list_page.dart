import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:inventory_app/data/list_items.dart';
import 'package:inventory_app/list_item_widget.dart';
import 'package:inventory_app/model/list_item.dart';

class BarCodePage extends StatefulWidget {
  const BarCodePage({Key? key}) : super(key: key);

  @override
  State<BarCodePage> createState() => _BarCodeState();
}

class _BarCodeState extends State<BarCodePage> {
  String _data = "";
  final listKey = GlobalKey<AnimatedListState>();
  List<ListItem> items = List.from(listItems);

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async => _scan(),
        tooltip: "Add New Items",
        child: const Icon(Icons.document_scanner),
      ),
      body: AnimatedList(
          key: listKey,
          initialItemCount: items.length,
          itemBuilder: (context, index, animation) => ListItemWidget(
                item: items[index],
                animation: animation,
                onClicked: () => removeItem(index),
              )),
    );
  }

  void removeItem(index) {
    final removedItem = items[index];

    items.removeAt(index);
    listKey.currentState!.removeItem(
        index,
        (context, animation) => ListItemWidget(
            item: removedItem, 
            animation: animation,
            onClicked: () {}));
  }
}
