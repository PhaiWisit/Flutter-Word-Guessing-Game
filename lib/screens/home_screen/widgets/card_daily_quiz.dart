import 'package:flutter/material.dart';
import 'package:word_test/screens/play_screen/play_screen.dart';
import 'package:word_test/screens/play_screen/play_screen_random.dart';

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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(height: 5),
                        Text(
                          "Random Quiz",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Container(height: 5),
                        Text(
                          "แบบทดสอบแบบสุ่ม",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Container(height: 10),
                        Text(
                          'สุ่มแบบทดสอบจากคำศัพท์ทุกระดับมาทดสอบ',
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(PlayScreenRandom.id);
                              },
                              child: Text(
                                'เริ่มเลย',
                                style: Theme.of(context).textTheme.bodyLarge,
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
