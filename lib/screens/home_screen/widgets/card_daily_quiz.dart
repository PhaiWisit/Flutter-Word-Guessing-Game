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
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.ac_unit_sharp,
                      size: 80,
                    ),
                  ),
                  // Image.asset(
                  //   ImgSample.get("reading.png"),
                  //   height: 100,
                  //   width: 100,
                  //   fit: BoxFit.cover,
                  // ),
                  Container(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(height: 5),
                        const Text(
                          "Daily Quiz",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Container(height: 5),
                        const Text(
                          "แบบทดสอบรายวันของคุณ",
                        ),
                        Container(height: 10),
                        const Text(
                          'ทำแบบทดสอบรายวันของคุณโดยการสุ่มคำศัพท์ในแต่ละระดับมาเล่น',
                          maxLines: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(QuizScreen.id);
                              },
                              child: const SizedBox(
                                width: 60,
                                height: 40,
                                child: Center(
                                  child: Text('เริ่มเลย'),
                                ),
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
