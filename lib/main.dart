import 'package:flutter/material.dart';
import 'package:jenga/data/data_store.dart';
import 'package:jenga/jenga_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataStore().load();
  
  runApp(JengaApp());
}

