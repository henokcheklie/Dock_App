// ignore_for_file: use_build_context_synchronously

import 'package:dock_app/home_screen.dart';
import 'package:dock_app/utility/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    ///

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const DockApp()));
    });
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dock',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kWhiteColor,
                        fontSize: 50.0,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2.0),
                  ),
                  Text(
                    'App',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          letterSpacing: 2.0,
                          fontSize: 50.0,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                  )
                ],
              ),
              const SizedBox(width: kDefaultPadding),
              const CircleAvatar(
                backgroundColor: kWhiteColor,
                backgroundImage: AssetImage('assets/app_icon.png'),
                minRadius: 50.0,
                maxRadius: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
