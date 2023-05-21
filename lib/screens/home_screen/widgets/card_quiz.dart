import 'package:flutter/material.dart';
import '../../../blocs/blocs_export.dart';
import '../../list_screen/list_screen.dart';

class CardQuiz extends StatelessWidget {
  final int level;
  final IconData icon;
  const CardQuiz({
    super.key,
    required this.level,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    String levelText = '';

    switch (level) {
      case 1:
        levelText = 'อนุบาล';
        break;
      case 2:
        levelText = 'ประถม';
        break;
      case 3:
        levelText = 'มัธยม';
        break;
      case 4:
        levelText = 'ปริญญา';
        break;
      case 5:
        levelText = 'หมอลำ';
        break;
      default:
        levelText = '';
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
          ),
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
                      context
                          .read<AppBlocBloc>()
                          .add(ChooseQuizLevel(quizLevel: level));
                      Navigator.of(context).pushNamed(ListScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              width: 80,
                              height: 80,
                              child: Icon(
                                icon,
                                size: 80,
                              )),
                          // Image.asset(
                          //   ImgSample.get("reading.png"),
                          //   height: 100,
                          //   width: 100,
                          //   fit: BoxFit.cover,
                          // ),
                          // Container(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(height: 10),
                                Text(
                                  "Level $level",
                                  style: Theme.of(context).textTheme.titleLarge,
                                  
                                ),
                                Container(height: 5),
                                Text("แบบทดสอบระดับ$levelText",
                                    style: Theme.of(context).textTheme.titleSmall
                                    ),
                                // Container(height: 10),
                                // const Text(
                                //   'ทำแบบทดสอบรายวันของคุณโดยการสุ่มคำศัพท์ในแต่ละระดับมาเล่น',
                                //   maxLines: 2,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   children: [
                                //     ElevatedButton(
                                //       onPressed: () {
                                //         Navigator.of(context).pushNamed(QuizScreen.id);
                                //       },
                                //       child: const SizedBox(
                                //         width: 60,
                                //         height: 40,
                                //         child: Center(
                                //           child: Text('เริ่มเลย'),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // )
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
      ),
    );
  }
}
