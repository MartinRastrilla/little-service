import 'package:flutter/material.dart';
import 'package:mobile/app/app.dart';
import 'package:mobile/app/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(const App());
}
