import 'package:flutter/material.dart';
import 'app.dart';
import 'core/utils/hive/hive_utils.dart';

void main() async{
 await HiveUtils.init();
  runApp(const MyApp());
}
