import 'package:flutter/material.dart';
import 'package:mostui/screens/app/bottom_navigation/bottom_navigation_screen.dart';
import 'package:mostui/screens/app/bottom_navigation/categories_screen.dart';
import 'package:mostui/screens/app/chat_screen.dart';
import 'package:mostui/screens/app/bottom_navigation/home_screen.dart';
import 'package:mostui/screens/app/bottom_navigation/settings_screen.dart';
import 'package:mostui/screens/app/bottom_navigation/users_screen.dart';
import 'package:mostui/screens/app/drawer/faqs_screen.dart';
import 'package:mostui/screens/app/drawer/tabs/info_screen.dart';
import 'package:mostui/screens/app/drawer/test_tab_screen.dart';
import 'package:mostui/screens/launch_screen.dart';
import 'package:mostui/screens/login_screen.dart';
import 'package:mostui/screens/onboarding_screen/onboarding_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/on_boarding_screen': (context) => const OnBoardingScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/bottom_navigation_screen': (context) => const BottomNavigationScreen(),
        // '/users_screen': (context) => const UsersScreen(),
        // '/categories_screen': (context) => const CategoriesScreen(),
        // '/home_screen': (context) => const HomeScreen(),
        // '/settings_screen': (context) => const SettingsScreen(),
        '/chat_screen': (context) => const ChatScreen(),
        '/info_screen': (context) => const InfoScreen(),
        '/faqs_screen': (context) => const FaqsScreen(),
        '/test_tab_screen': (context) => const TestTabScreen(),
      },
    );
  }
}
