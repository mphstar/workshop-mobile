// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageFormData extends StatefulWidget {
  @override
  State<PageFormData> createState() => _PageFormDataState();
}

class _PageFormDataState extends State<PageFormData> {
  final controllerNama = TextEditingController();
  final controllerPass = TextEditingController();
  final controllerMoto = TextEditingController();

  List<String> agama = [
    'Islam',
    'Kristen Protenstan',
    'Kristen Katolik',
    'Hindu',
    'Budha'
  ];

  String _agama = 'Islam';
  String _jk = '';

  void pilihJK(String value) {
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void kirimData() {
    AlertDialog alert = new AlertDialog(
      title: Text('Form Data'),
      content: SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            SizedBox(
              height: 10,
            ),
            Text('Nama lengkap = ${controllerNama.text}'),
            Text('Password = ${controllerPass.text.toString()}'),
            Text('Moto Hidup = ${controllerMoto.text.toString()}'),
            Text('Jenis Kelamin = ${_jk.toString()}'),
            Text('Agama = ${_agama.toString()}'),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('OK')),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Close')),
      ],
    );

    Get.dialog(alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                    hintText: 'Nama Lengkap',
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: controllerMoto,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Moto Hidup',
                    labelText: 'Moto Hidup',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                RadioListTile(
                  value: 'Laki-laki',
                  groupValue: _jk,
                  onChanged: (String? value) {
                    pilihJK(value!);
                  },
                  activeColor: Colors.blue,
                  title: Text('Pilih ini jika anda laki-laki'),
                ),
                RadioListTile(
                  value: 'Perempuan',
                  groupValue: _jk,
                  onChanged: (String? value) {
                    pilihJK(value!);
                  },
                  activeColor: Colors.blue,
                  title: Text('Pilih ini jika anda perempuan'),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Agama ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    DropdownButton(
                      items: agama.map((String value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        pilihAgama(value!);
                      },
                      value: _agama,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => kirimData(),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
