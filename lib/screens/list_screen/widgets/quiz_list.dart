import 'package:flutter/material.dart';
import 'package:word_test/screens/quiz_screen/quiz_screen.dart';
import '../../../blocs/blocs_export.dart';

class QuizList extends StatelessWidget {
  final int quizNumber;

  const QuizList({
    super.key,
    required this.quizNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        // BoxShadow(
        //   color: Colors.black12,
        //   // blurRadius: 5.0,
        // ),
      ]),
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
                    // context
                    //     .read<AppBlocBloc>()
                    //     .add(ChooseQuizLevel(quizLevel: quizNumber));
                    Navigator.of(context).pushNamed(QuizScreen.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            width: 80,
                            height: 80,
                            child: Stack(
                              children: [
                                const Icon(
                                  Icons.circle_outlined,
                                  size: 80,
                                ),
                                Center(
                                    child: Text(
                                  '$quizNumber',
                                  style: Theme.of(context).textTheme.titleLarge,
                                )),
                              ],
                            )),
                        // Image.asset(
                        //   ImgSample.get("reading.png"),
                        //   height: 100,
                        //   width: 100,
                        //   fit: BoxFit.cover,
                        // ),
                        // Container(width: 10),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(height: 10),
                                  Text(
                                    "แบบทดสอบที่ $quizNumber",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Container(height: 5),
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 10),
                                  const Icon(Icons.check_box_outline_blank),
                                  const SizedBox(height: 5),
                                  Text(
                                    '0/20',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
