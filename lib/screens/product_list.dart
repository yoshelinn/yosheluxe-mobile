import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yosheluxe_mobile/widgets/left_drawer.dart';
import 'package:yosheluxe_mobile/models/Product.dart';
import 'package:yosheluxe_mobile/screens/product_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class YosheluxeListPage extends StatefulWidget {
  const YosheluxeListPage({Key? key}) : super(key: key);

  @override
  State<YosheluxeListPage> createState() => _YosheluxeListPageState();
}

class _YosheluxeListPageState extends State<YosheluxeListPage> {
  Future<List<Product>> fetchItem(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/user_data/');

    List<Product> listItem = [];
    for (var i in response) {
      Product product = Product.fromJson(i);
      listItem.add(product);
    }

    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(request),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "No data.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.amount}"),
                                const SizedBox(height: 10),
                                Text(
                                    "${snapshot.data![index].fields.description}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.code}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.price}"),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ItemPage(
                                                  snapshot.data![index])));
                                    },
                                    child: const Text("Product Detail"))
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
