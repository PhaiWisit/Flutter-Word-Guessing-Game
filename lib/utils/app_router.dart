import 'package:flutter/material.dart';
import 'package:word_test/screens/about_screen/about_screen.dart';
import 'package:word_test/screens/home_screen/home_screen.dart';
import 'package:word_test/screens/list_screen/list_screen.dart';
import 'package:word_test/screens/quiz_screen/quiz_screen.dart';
import 'package:word_test/screens/setting_screen/setting_screen.dart';
import 'package:word_test/screens/test_screen/test_screen.dart';


class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case QuizScreen.id:
        return MaterialPageRoute(
          builder: (_) =>  const QuizScreen(),
        );
      case SettingScreen.id:
        return MaterialPageRoute(
          builder: (_) =>  const SettingScreen(),
        );
      case AboutScreen.id:
        return MaterialPageRoute(
          builder: (_) =>  const AboutScreen(),
        );
      case ListScreen.id:
        return MaterialPageRoute(
          builder: (_) =>  const ListScreen(),
        );
      case TestScreen.id:
        return MaterialPageRoute(
          builder: (_) =>   TestScreen(),
        );
      default :
        return null;  
    }
  }
}
