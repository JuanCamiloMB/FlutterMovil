import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/profile_page.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/authwrapper.dart';
import 'package:myapp/pages/register_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      routes: {
        '/login': (context) => LoginPage(),
        '/register':  (context)=> RegisterPage(),
        '/profile': (context) => AuthWrapper(child: ProfilePage()),
        '/home': (context)=> AuthWrapper(child: HomePage())
      },
      initialRoute: '/login',
    );
  }
}
