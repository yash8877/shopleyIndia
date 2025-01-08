import 'package:clothapp/screens/OnboardingScreen.dart';
import 'package:clothapp/screens/forgot_email_screen.dart';
import 'package:clothapp/screens/forgot_password_screen.dart';
import 'package:clothapp/screens/languages_screen.dart';
import 'package:clothapp/screens/login_screen.dart';
import 'package:clothapp/screens/otp_verification_screen.dart';
import 'package:clothapp/screens/splash_screen.dart';
import 'package:clothapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor:  Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopleyIndia',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}

