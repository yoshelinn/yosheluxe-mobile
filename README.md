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


