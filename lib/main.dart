import 'package:explore_era/Screens/home_page.dart';
import 'package:explore_era/Screens/sign_in.dart';
import 'package:provider/provider.dart';
import 'package:explore_era/Provider/app.provider.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            primary: const Color.fromRGBO(254, 206, 1, 1),
            seedColor: const Color.fromARGB(129, 254, 208, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // home: const MyHomePage(),
        home: const SignIn(),
      ),
    );
  }
}
