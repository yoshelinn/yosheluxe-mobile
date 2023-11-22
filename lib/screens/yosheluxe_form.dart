import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:yosheluxe_mobile/widgets/left_drawer.dart';

import 'package:flutter/material.dart';
import 'package:yosheluxe_mobile/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:yosheluxe_mobile/widgets/left_drawer.dart';
import 'package:yosheluxe_mobile/screens/menu.dart';
import 'dart:convert';

class YosheluxeFormPage extends StatefulWidget {
  const YosheluxeFormPage({super.key});

    @override
  State<YosheluxeFormPage> createState() => _YosheluxeFormPageState();
}

class _YosheluxeFormPageState extends State<YosheluxeFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  int _code = 0;
  int _price = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Add Your Yosheluxe Items Here!',
                textAlign: TextAlign.center,
              ),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.teal,
          ),
          drawer: const LeftDrawer(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Product Name",
                          labelText: "Product Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _name = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Can't be empty!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Amount",
                          labelText: "Amount",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _amount = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Can't be empty!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Can't be empty!";
                          }
                          return null;
                        },
                      ),
                    ),
                                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Price",
                          labelText: "Price",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _price = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Can't be empty!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Can't be empty!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Description",
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _description = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Description can't be empty!";
                          }
                          return null;
                        },
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.green.shade700),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Kirim ke Django dan tunggu respons

                              final response = await request.postJson(
                                  "http://127.0.0.1:8000/create-flutter/",
                                  jsonEncode(<String, String>{
                                    'name': _name,
                                    'amount': _amount.toString(),
                                    'description': _description,
                                    'price': _price.toString(),

                                  }));
                              if (response['status'] == 'success') {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text("Saved succesfully!"),
                                  ));
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()),
                                  );
                                }
                              } else {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Error occured. Try again."),
                                  ));
                                }
                              }
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
