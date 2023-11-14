import 'package:flutter/material.dart';
import 'package:yosheluxe_mobile/Item.dart';

class items extends StatelessWidget {
  items({super.key});

  final List<Item> itemList = Item.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Your Products',
          ),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemList[index].name),
            subtitle: Text('Amount: ${itemList[index].amount}'),
            trailing: Text('Description: ${itemList[index].description}'),
          );
        },
      ),
    );
  }
}
