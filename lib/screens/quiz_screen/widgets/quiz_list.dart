import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:word_test/models/quiz_model.dart';
import 'package:word_test/screens/play_screen/play_screen.dart';
import '../../../blocs/blocs_export.dart';

// ignore: must_be_immutable
class QuizList extends StatelessWidget {
  QuizModel quiz;
  QuizList({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  Row _rateStar(int quizRate) {
    switch (quizRate) {
      case 1:
        return Row(
          children: const [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Icon(Icons.star_border,color: Colors.amber,),
            Icon(Icons.star_border,color: Colors.amber,),
          ],
        );
      case 2:
        return Row(
          children: const [
            Icon(Icons.star,color: Colors.amber,),
            Icon(Icons.star,color: Colors.amber,),
            Icon(Icons.star_border,color: Colors.amber,),
          ],
        );
      case 3:
        return Row(
          children: const [
            Icon(Icons.star,color: Colors.amber,),
            Icon(Icons.star,color: Colors.amber,),
            Icon(Icons.star,color: Colors.amber,),
          ],
        );
      default:
        return Row(
          children: const [
            Icon(Icons.star_border,color: Colors.amber,),
            Icon(Icons.star_border,color: Colors.amber,),
            Icon(Icons.star_border,color: Colors.amber,),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: []),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BlocBuilder<AppBlocBloc, AppBlocState>(
              builder: (context, state) {
                return InkWell(
                  highlightColor: Colors.white10,
                  onTap: () {
                    context
                        .read<AppBlocBloc>()
                        .add(ChooseQuiz(quiz: quiz.quizId));
                    log('quiz id in quiz list is ${quiz.quizId.toString()}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayScreen(
                                quizId: quiz.quizId,
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(height: 10),
                                    Text(
                                      quiz.quizName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    Container(height: 5),
                                    _rateStar(quiz.quizRate),
                                    Container(height: 5),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    quiz.quizScore != 0
                                        ? const Icon(Icons.check_box)
                                        : const Icon(
                                            Icons.check_box_outline_blank),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${quiz.quizScore}/20',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
