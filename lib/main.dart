import 'package:dock_app/splash_screen.dart';
import 'package:dock_app/utility/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Main application widget that holds the Dock widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: cardBackgroundColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: kWhiteColor,
          ),
          bodyMedium: TextStyle(color: kWhiteColor),
          bodySmall: TextStyle(color: kWhiteColor),
          titleMedium: TextStyle(
            color: kWhiteColor,
          ),
          titleSmall: TextStyle(color: kWhiteColor),
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: cardBackgroundColor,
            surfaceTintColor: kBackgroundColor,
            titleTextStyle: titleStyle),
        iconTheme: const IconThemeData(color: kWhiteColor),
      ),
    );
  }
}
