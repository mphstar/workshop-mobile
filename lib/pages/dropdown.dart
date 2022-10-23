// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Pilihan> listPilihan = <Pilihan>[
  Pilihan(teks: 'Red', warna: Colors.red),
  Pilihan(teks: 'Green', warna: Colors.green),
  Pilihan(teks: 'Blue', warna: Colors.blue),
];

class DropdownPage extends StatefulWidget {
  static const Map<String, Color> _color = {
    'Chimmy': Color(0xFF2D8569),
    'Cooky': Color(0xFFF38688),
    'Koya': Color(0xFF45CAF5),
    'Mang': Color(0xFFB19ECB),
    'RJ': Color(0xFFF58E4C),
  };

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  final List<String> gambar = [
    "1.jpg",
    "2.jpeg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
  ];

  Color warna = Colors.red;

  void _pilihannya(Pilihan pilihan) {
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown'),
        backgroundColor: warna,
        actions: [
          PopupMenuButton<Pilihan>(
              onSelected: _pilihannya,
              itemBuilder: (BuildContext context) {
                return listPilihan.map((Pilihan x) {
                  return PopupMenuItem<Pilihan>(
                    child: Text(x.teks),
                    value: x,
                  );
                }).toList();
              })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: const [
            Colors.white,
            Colors.purpleAccent,
            Colors.deepPurple,
          ],
        )),
        child: PageView.builder(
            controller: PageController(viewportFraction: 0.8),
            itemCount: gambar.length,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
                child: Material(
                  elevation: 8.0,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: gambar[i],
                        child: Material(
                          child: InkWell(
                            child: Flexible(
                              flex: 1,
                              child: Container(
                                color: DropdownPage._color.values.elementAt(i),
                                child: Image.asset(
                                  "img/${gambar[i]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () => Get.to(PageTwo(
                                gambar: gambar[i],
                                colors:
                                    DropdownPage._color.values.elementAt(i))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}


class PageTwo extends StatefulWidget {
  final String gambar;
  final Color colors;

  PageTwo({required this.gambar, required this.colors});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  Color warna = Colors.red;

  void _pilihannya(Pilihan pilihan) {
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
        backgroundColor: warna,
        actions: [
          PopupMenuButton<Pilihan>(
              onSelected: _pilihannya,
              itemBuilder: (BuildContext context) {
                return listPilihan.map((Pilihan x) {
                  return PopupMenuItem<Pilihan>(
                    child: Text(x.teks),
                    value: x,
                  );
                }).toList();
              })
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: const [
                  Colors.purple,
                  Colors.white,
                  Colors.deepPurple,
                ],
              ),
            ),
          ),
          Center(
            child: Hero(
              tag: widget.gambar,
              child: ClipOval(
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Material(
                    child: InkWell(
                      onTap: () => Get.back,
                      child: Flexible(
                          flex: 1,
                          child: Container(
                            color: widget.colors,
                            child: Image.asset(
                              "img/${widget.gambar}",
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Pilihan {
  final String teks;
  final Color warna;
  Pilihan({required this.teks, required this.warna});
}
