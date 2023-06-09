import 'package:flutter/material.dart';
import 'package:word_test/screens/quiz_screen/quiz_screen.dart';

class CardDailyQuiz extends StatelessWidget {
  const CardDailyQuiz({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10.0,
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    width: 70,
                    height: 70,
                    child: Icon(
                      Icons.calendar_month_outlined,
                      size: 70,
                    ),
                  ),
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
                        Container(height: 5),
                        Text(
                          "Daily Quiz",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Container(height: 5),
                        Text(
                          "แบบทดสอบรายวันของคุณ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(height: 10),
                        Text(
                          'ทำแบบทดสอบรายวันของคุณโดยการสุ่มคำศัพท์ในแต่ละระดับมาเล่น',
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(QuizScreen.id);
                              },
                              child: Text(
                                'เริ่มเลย',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
