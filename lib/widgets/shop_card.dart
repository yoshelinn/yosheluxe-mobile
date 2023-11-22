import 'package:flutter/material.dart';
import 'package:yosheluxe_mobile/screens/yosheluxe_form.dart';
import 'package:yosheluxe_mobile/screens/product_list.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:yosheluxe_mobile/screens/login.dart';
import 'package:provider/provider.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class YosheluxeCard extends StatelessWidget {
  final ShopItem item;

  const YosheluxeCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: Material(
          color: item.color,
          child: InkWell(
            onTap: () async {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
              if (item.name == "Tambah Item") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const YosheluxeFormPage()));
              } else if (item.name == "Lihat Item") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const YosheluxeListPage()));
              } else if (item.name == "Logout") {
                final response = await request
                    .logout("http://127.0.0.1:8000/auth/logout/");
                String message = response['message'];
                if (response['status']) {
                  if (context.mounted) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  }
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(message),
                    ));
                  }
                }
              }
            },
            child: Container(
              // Container Icon dan Text
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
