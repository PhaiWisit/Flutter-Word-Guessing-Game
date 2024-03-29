import 'package:flutter/material.dart';
import 'package:word_test/screens/about_screen/about_screen.dart';
import 'package:word_test/screens/home_screen/home_screen.dart';
import 'package:word_test/screens/quiz_screen/quiz_screen.dart';
import 'package:word_test/screens/play_screen/play_screen.dart';
import 'package:word_test/screens/setting_screen/setting_screen.dart';
import 'package:word_test/screens/test_screen/test_screen.dart';

import '../screens/play_screen/play_screen_random.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case PlayScreen.id:
        return MaterialPageRoute(
          builder: (_) => PlayScreen(
            quizId: 0,
          ),
        );
      case SettingScreen.id:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case AboutScreen.id:
        return MaterialPageRoute(
          builder: (_) => const AboutScreen(),
        );
      case QuizScreen.id:
        return MaterialPageRoute(
          builder: (_) => const QuizScreen(),
        );
      case TestScreen.id:
        return MaterialPageRoute(
          builder: (_) =>  TestScreen(),
        );
      case PlayScreenRandom.id:
        return MaterialPageRoute(
          builder: (_) =>  PlayScreenRandom(quizId: 0),
        );
      default:
        return null;
    }
  }
}
