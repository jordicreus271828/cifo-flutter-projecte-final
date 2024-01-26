import 'package:compulsilina/styles/styles.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Compulsilina());
}

class Compulsilina extends StatelessWidget {
  const Compulsilina({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Compulsilina",
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
        Locale('ca'), // Catalan
      ],
      theme: AppStyles.themeData,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
