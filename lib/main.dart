import 'package:catalog_app/data/providers/api_provider.dart';
import 'package:catalog_app/data/providers/db_provider.dart';
import 'package:catalog_app/di/configure_dependecies.dart';
import 'package:catalog_app/presentation/pages/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const App());
}

