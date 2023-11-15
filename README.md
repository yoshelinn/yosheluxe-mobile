# Welcome to Yosheluxe!

# ===========================

# ₊✧ Tugas 7 PBP ₊✧

# ===========================

# Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Stateful Widget adalah jenis widget yang digunakan untuk mengelola dan memperbarui keadaan atau state dalam aplikasi Anda. Ini cocok untuk komponen yang perlu memantau perubahan data atau merespons interaksi pengguna. Contohnya adalah tombol "Like" pada media sosial

Sebaliknya, widget tidak berubah atau statis adalah jenis widget yang digunakan untuk elemen aplikasi yang tidak perlu mempertahankan status atau tidak berubah selama sesi pengguna. Contohnya label teks atau ikon yang hanya menampilkan informasi

# Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
 yang digunakan pada tugas kali ini:
1. `SingleChildScrollView`: Widget ini berfungsi sebagai widget-wrapper yang memungkinkan kontennya dapat di-scroll.
2. `Center`: Widget untuk mengatur posisi child ke tengah.
3. `InkWell`: Widget ini memberikan respons saat ditekan, seperti perubahan tampilan ketika disentuh.
4. `Text`: Widget untuk menampilkan teks.
5. `Gridview`: Widget ini digunakan untuk menampilkan child-widget dalam bentuk tata letak kotak atau matriks dua dimensi.
6. `AppBar`: Widget ini digunakan untuk menampilkan bagian atas aplikasi yang sering berisi judul, ikon, dan tindakan yang sesuai.
7. `Scaffold`: Widget ini berfungsi sebagai struktur visual dasar yang memberikan wadah untuk meletakkan dan mengatur widget lainnya.
8. `Padding`: Widget ini digunakan untuk memberikan ruang tambahan di sekeliling child-widget yang ada di dalamnya.
9. `Container`: Widget ini berperan sebagai wadah yang mengatur tampilan dan tata letak child-widget yang berada di dalamnya.
10. `SnackBar`: Widget ini digunakan untuk menampilkan pesan singkat atau notifikasi pada bagian bawah aplikasi.
11. `Icon`: Widget untuk menampilkan ikon.
12. `Material App`: Widget ini digunakan untuk mengkonfigurasi tema dan tampilan standar aplikasi berdasarkan Material UI.
13. `Column`: Widget ini digunakan untuk menyusun child-widget secara vertikal dalam bentuk kolom.

# Implementasi Checklist 
1. Melakukan instalasi flutter pada link berikut:
   <https://docs.flutter.dev/get-started/install/windows>

2. Membuat aplikasi baru dengan command berikut:
   ```flutter create yosheluxe_mobile```

4. Melengkapi `menu.dart`yang berisi ketiga komponen widget
```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("See Products", Icons.checklist, Colors.blue),
    ShopItem("Add Products", Icons.add_shopping_cart, Colors.green),
    ShopItem("Logout", Icons.logout, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor : Colors.teal,
        title: const Text(
          'Yosheluxe',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Welcome to Yosheluxe', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
    ...
    ...
```
4. Membuat snackbar untuk setiap button yang dipencet, menggunakan InkWell Widget.
   ```dart
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("${item.name} Succesfully!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
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
    );

    ```
   
5. Menghubungkan `main.dart` dengan mengimpor pacakage dari `menu.dart`
```dart
import 'package:flutter/material.dart';
import 'package:yosheluxe_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yosheluxe',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      
      home: MyHomePage(),
    );
  }
}
```

6. Menambahkan atribut `Color` untuk menghasilkan warna widget yang berbeda
Pada class `ShopItem`:
```dart
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```

Pada class MyHomePage:
```dart
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("See Products", Icons.checklist, Colors.blue),
    ShopItem("Add Products", Icons.add_shopping_cart, Colors.green),
    ShopItem("Logout", Icons.logout, Colors.red),
  ];
```

7. Color card diganti menjadi `item.color`
```dart
Widget build(BuildContext context) {
  return Material(
    color: item.color,
    child: InkWell(
    ...
    ...
```

8. Run aplikasi dengan command berikut:
`flutter run -d chrome`


# ===========================

# ₊✧ Tugas 8 PBP ₊✧

# ===========================
# Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
`Navigator.push()` adalah metode routing yang menambahkan rute ke dalam stack routing, sedangkan `Navigator.pushReplacement()` mengganti rute ke dalam stack routing. Jika pengguna ingin kembali ke halaman sebelumnya, mereka dapat menggunakan `Navigator.push()`. Namun, untuk mencegah mereka kembali ke halaman sebelumnya, gunakan `Navigator.pushReplacement()`

# Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
`Align`: Widget yang berfungsi untuk menyusun children di dalamnya dengan memberikan properti alignment yang dapat disesuaikan.
`Row`: widget yang digunakan untuk menyusun children secara horizontal, membentuk baris.
`Container`: Widget yang membungkus child dan mengatur tata letaknya, memberikan kontrol atas properti-properti seperti padding, margin, dan dekorasi.
`Center`: Widget yang berfungsi untuk menempatkan children ke tengah-tengah ruang yang tersedia.
`Expanded`: Widget yang memungkinkan ekspansi children dari Row dan Column untuk mengisi space yang tersedia.
`Baseline`: Widget yang digunakan untuk menempatkan child-widget sesuai dengan titik awal (baseline) parent widget.
`SizedBox`: Widget yang memberikan ukuran spesifik pada child-widget di dalamnya.
`LimitedBox`: Widget yang memberikan batasan ukuran maksimal pada child-widget di dalamnya.
`Padding`: Widget yang memberikan ruang tambahan di sekitar child-widget yang terkandung di dalamnya.
`GridView`: Widget yang digunakan untuk menampilkan children dalam bentuk array dua dimensi, mengatur tata letak grid pada aplikasi.

# Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Untuk tugas kali ini, saya menggunakan `TextFormField` untuk menerima input berupa `product name`, `amount`, dan `description`. Kemudian saya melakukan verifikasi input pengguna sesuai dengan ketentuan tipe masing-masing input.

# Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean architecture pada Flutter dirancang untuk mencapai pemisahan task yang jelas, memastikan kebersihan dan modularitas dalam kode. 
Strukturnya terdiri dari tiga layer utama: 
- Presentation Layer,  memuat komponen antarmuka pengguna seperti widget, layar, dan tampilan
- Domain Layer,  berfokus pada logika bisnis inti aplikasi dengan menyertakan use cases, entitas, dan aturan bisnis
- Data Layer,  bertanggung jawab atas pengambilan dan penyimpanan data melalui repositori dan sumber data. Repositori di bagian Data Layer menyediakan abstraksi untuk mengakses dan memanipulasi data, menciptakan kode yang modular, scalable, dan dapat diuji.

# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
1. Pertama, saya membuat halaman `yosheluxe_form.dart`
```dart
import 'package:flutter/material.dart';
import 'package:yosheluxe_mobile/widgets/left_drawer.dart';

import 'package:flutter/material.dart';
import 'package:yosheluxe_mobile/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Add Your New Product Here! ',
            ),
          ),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        
        body: Form(
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
                        return "Name can't be empty!";
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
                        return "Price can't be empty!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Price can't be empty!";
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
                        backgroundColor:
                            MaterialStateProperty.all(const Color.fromARGB(255, 32, 168, 155)),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Product Saved!'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: $_name'),
                                      Text('Price: $_price'),
                                      Text('Description: $_description'),
                                      // TODO: Munculkan value-value lainnya
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        _formKey.currentState!.reset();
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
      );
    }
}
```
2. Membuat drawer pada page
```dart
import 'package:yosheluxe_mobile/screens/items.dart';
import 'package:flutter/material.dart';
import 'package:yosheluxe_mobile/screens/menu.dart';
import 'package:yosheluxe_mobile/screens/yosheluxe_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 16, 228, 207),
            ),
            child: Column(
              children: [
                Text(
                  'Yosheluxe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Elegance and Perfections Bags, Elevating Your Everyday.!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,

                    // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                    ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            	onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Product'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopFormPage(),

                    )
                  );
                },
              ),
              ListTile(
                      leading: const Icon(Icons.list),
                      title: const Text('Lihat Produk'),
                      // Bagian redirection ke ShopFormPage
                      onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => items()));
                      },
                    ),
        ],
      ),
    );
  }
}
```

3. Pengerjaan bonus dengan menampilkan product yang sudah ditambahkan oleh pengguna, seperti berikut:
```dart
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
```

4.  Melengkapi `Item.dart`
```dart
class Item {
  String name;
  int amount;
  String description;

  static List<Item> items = [];

  Item(this.name, this.amount, this.description) {
    items.add(this);
  }
}

```



