import 'package:firebase_auth_app/firebase_options.dart';
import 'package:firebase_auth_app/route/route_generator.dart';
import 'package:firebase_auth_app/route/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.logIn,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
