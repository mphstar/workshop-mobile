// ignore_for_file: file_names

import 'package:tugas_app/pages/hive.dart';
import 'package:tugas_app/pages/pageGps.dart';
import 'package:tugas_app/pages/pageSql.dart';
import 'package:tugas_app/pages/register.dart';

import './pages/gradient.dart';
import './pages/pageview.dart';
import 'pages/FormData.dart';
import 'pages/dropdown.dart';
import './pages/form.dart';
import './pages/pageGps2.dart';

class ChartModel {
  final String name;
  final String message;
  final String time;

  final dynamic page;

  ChartModel({required this.name, required this.message, required this.time, required this.page});
}

final List<ChartModel> items = [
  ChartModel(
      name: 'Gradient',
      message: 'Acara 21 - Gradient Flutter',
      time: '12.00',
      page: GradientPage(),
  ),
  ChartModel(
      name: 'Page View',
      message: 'Acara 22 - Page View Flutter',
      time: '12.00',
      page: PageViewPage(),
  ),
  ChartModel(
      name: 'Dropdown',
      message: 'Acara 23 - Dropdown Flutter',
      time: '12.00',
      page: DropdownPage(),
  ),
  ChartModel(
      name: 'Form',
      message: 'Acara 25 & 26 - Form',
      time: '12.00',
      page: PageForm(),
  ),
  ChartModel(
      name: 'Form',
      message: 'Acara 27 - Form Data',
      time: '12.00',
      page: PageFormData(),
  ),
  ChartModel(
      name: 'Form',
      message: 'Acara 28 - Register',
      time: '12.00',
      page: registerPage(),
  ),
  ChartModel(
      name: 'Storage',
      message: 'TSA - Hive',
      time: '12.00',
      page: hivePage(),
  ),
  ChartModel(
      name: 'Storage',
      message: 'TSA - SQFlite',
      time: '12.00',
      page: pageSql(),
  ),
  ChartModel(
      name: 'GPS',
      message: 'TSA - GPS',
      time: '12.00',
      page: pageGps(),
  ),
  ChartModel(
      name: 'GPS',
      message: 'TSA - GPS 2',
      time: '12.00',
      page: pageGps2(),
  )
];
