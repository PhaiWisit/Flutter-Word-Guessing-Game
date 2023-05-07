import 'package:flutter/material.dart';
import 'package:word_test/blocs/blocs_export.dart';
import 'package:word_test/screens/quiz_screen/widgets/button_choice.dart';
import 'package:word_test/screens/quiz_screen/widgets/flip_card.dart';

class QuizScreen extends StatelessWidget {
  static const id = 'quiz_screen';

  const QuizScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการแบบทดสอบ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<AppBlocBloc, AppBlocState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Level ${state.quizLevel}',
                    style: const TextStyle(fontSize: 30),
                  ),
                  const FlipCardProvider(),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ButtonChoice(
                        width: 180,
                        height: 100,
                        title: 'choice 1',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ButtonChoice(
                        width: 180,
                        height: 100,
                        title: 'choice 2',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ButtonChoice(
                        width: 180,
                        height: 100,
                        title: 'choice 3',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ButtonChoice(
                        width: 180,
                        height: 100,
                        title: 'choice 4',
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
