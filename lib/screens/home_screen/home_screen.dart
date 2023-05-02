import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:word_test/screens/about_screen/about_screen.dart';
import 'package:word_test/screens/home_screen/widgets/button_daily_quiz.dart';
import 'package:word_test/screens/home_screen/widgets/button_quiz.dart';
import 'package:word_test/screens/home_screen/widgets/popup_menu.dart';
import 'package:word_test/screens/setting_screen/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bear Words'),
        actions:const [
           PopupMenu()
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.abc,
                size: 150,
              ),
              const Text(
                'แบบทดสอบ',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonDailyQuiz(width: 350, height: 150),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ButtonQuiz(
                      width: 150,
                      height: 150,
                      level: 1,
                      icon: Icons.one_k_outlined,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ButtonQuiz(
                      width: 150,
                      height: 150,
                      level: 2,
                      icon: Icons.two_k_outlined,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ButtonQuiz(
                      width: 150,
                      height: 150,
                      level: 3,
                      icon: Icons.three_k_outlined,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ButtonQuiz(
                      width: 150,
                      height: 150,
                      level: 4,
                      icon: Icons.four_k_outlined,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


