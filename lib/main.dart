import 'package:explore_era/Pages/auth_page.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:explore_era/Provider/app.provider.dart';
import 'package:explore_era/Pages/SignIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // if (kIsWeb) {
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDFfllNWmxhqAcjIC6e2Tv1U-gumDQ3arw',
      appId: '1:627740867098:web:77473ff6f9cef331f62fa3',
      messagingSenderId: '627740867098',
      projectId: 'exploreera-4e9ca',
    ),
  );
  // }
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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SignIn(),
        home: Auth(),
      ),
    );
  }
}
