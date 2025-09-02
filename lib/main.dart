import 'package:pet_care/ui/splash.dart';
import 'package:pet_care/services/dio_client.dart';
import 'package:flutter/material.dart';

void main() {
  DioClient().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}
