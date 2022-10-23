// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewPage extends StatelessWidget {
  final List<String> gambar = [
    "1.jpg",
    "2.jpeg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
  ];

  static const Map<String, Color> _color = {
    'Chimmy': Color(0xFF2D8569),
    'Cooky': Color(0xFFF38688),
    'Koya': Color(0xFF45CAF5),
    'Mang': Color(0xFFB19ECB),
    'RJ': Color(0xFFF58E4C),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page View'),
        backgroundColor: Colors.purpleAccent,
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
                                color: _color.values.elementAt(i),
                                child: Image.asset(
                                  "img/${gambar[i]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () => Get.to(PageTwo(
                                gambar: gambar[i],
                                colors: _color.values.elementAt(i))),
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

class PageTwo extends StatelessWidget {
  final String gambar;
  final Color colors;

  PageTwo({required this.gambar, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
        backgroundColor: Colors.purpleAccent,
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
              tag: gambar,
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
                            color: colors,
                            child: Image.asset(
                              "img/${gambar}",
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
