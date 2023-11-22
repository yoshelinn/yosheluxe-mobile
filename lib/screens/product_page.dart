import 'package:flutter/material.dart';
import 'package:yosheluxe_mobile/models/Product.dart';
import 'package:yosheluxe_mobile/widgets/left_drawer.dart';

class ItemPage extends StatelessWidget {
  final Product product;

  const ItemPage(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Name: ${product.fields.name}"),
            Text("Amount: ${product.fields.amount}"),
            Text("Description: ${product.fields.description}"),
            Text("Price: ${product.fields.price}"),
          ],
        ),
      ),
    );
  }
}
