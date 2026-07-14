import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mobile/app/app.dart';
import 'package:mobile/app/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es_AR');
  await setupDependencyInjection();
  runApp(const App());
}
