import 'package:flutter/material.dart';
import 'package:word_test/screens/home_screen/widgets/card_daily_quiz.dart';
import 'package:word_test/screens/home_screen/widgets/card_quiz.dart';
import 'package:word_test/screens/home_screen/widgets/container_head.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const spaceBetweenLevel = 10.0;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const ContainerHead(),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 230,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          // Text(
                          //   '    User Name',
                          //   style: TextStyle(fontSize: 30),
                          // ),
                        ],
                      ),
                      const SizedBox(height: spaceBetweenLevel),
                      const CardDailyQuiz(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Text('All Quiz',style: Theme.of(context).textTheme.titleMedium,),
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(height: 10),
                      const CardQuiz(
                        level: 1,
                        icon: Icons.looks_one,
                      ),
                      const SizedBox(height: spaceBetweenLevel),
                      const CardQuiz(
                        level: 2,
                        icon: Icons.looks_two,
                      ),
                      const SizedBox(height: spaceBetweenLevel),
                      const CardQuiz(
                        level: 3,
                        icon: Icons.looks_3,
                      ),
                      const SizedBox(height: spaceBetweenLevel),
                      const CardQuiz(
                        level: 4,
                        icon: Icons.looks_4,
                      ),
                      const SizedBox(height: spaceBetweenLevel),
                      const CardQuiz(
                        level: 5,
                        icon: Icons.looks_5,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


