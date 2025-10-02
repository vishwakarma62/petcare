import 'package:pet_care/ui/splash.dart';
import 'package:pet_care/ui/petdetails.dart';
import 'package:pet_care/services/service_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceManager().initialize();
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
      routes: {
        '/add-pet': (context) => const PetDetails(),
        '/edit-pet': (context) {
          final petData = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
          return PetDetails(petData: petData);
        },
      },
    );
  }
}
