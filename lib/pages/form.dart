// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageForm extends StatefulWidget {
  @override
  State<PageForm> createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  final _formkey = GlobalKey<FormState>();
  final textC = TextEditingController();
  double nilaiSlider = 1;
  bool nilaiCheckbox = false;

  bool nilaiSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: textC,
                decoration: InputDecoration(
                  hintText: "Contoh",
                  labelText: "Nama Lengkap",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    icon: Icon(Icons.security),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              CheckboxListTile(
                value: nilaiCheckbox,
                onChanged: (value) {
                  setState(() {
                    nilaiCheckbox = value!;
                  });
                },
                title: Text('Belajar Dasar Flutter'),
                subtitle: Text('Checkbox'),
                activeColor: Colors.deepPurpleAccent,
              ),
              SwitchListTile(
                value: nilaiSwitch,
                onChanged: (value) {
                  setState(() {
                    nilaiSwitch = value;
                  });
                },
                title: Text('Belajar Dasar Flutter'),
                subtitle: Text('Switch'),
                activeColor: Colors.red,
                activeTrackColor: Colors.pink[100],
              ),
              Slider(
                  value: nilaiSlider,
                  onChanged: (value) {
                    setState(() {
                      nilaiSlider = value;
                    });
                  }),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Get.dialog(
                      AlertDialog(
                        title: Text('Result'),
                        content: SizedBox(
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Nama lengkap = ${textC.text}'),
                              Text(
                                  'Nilai Checkbox = ${nilaiCheckbox.toString()}'),
                              Text('Nilai Switch = ${nilaiSwitch.toString()}'),
                              Text('Nilai Slider = ${nilaiSlider.toString()}'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(onPressed: () {
                            Get.back();
                          }, child: Text('OK')),
                          TextButton(onPressed: () {
                            Get.back();
                          }, child: Text('Close')),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
