import 'package:flutter/material.dart';
import 'package:word_test/blocs/blocs_export.dart';
import 'package:word_test/screens/quiz_screen/widgets/flip_card.dart';

import '../setting_screen/setting_screen.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SettingScreen.id);
              },
              icon: const Icon(Icons.settings))
        ],
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
                  const SizedBox(height: 20),
                  Container(
                    width: 180,
                    height: 80,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.black12),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'แบบทดสอบที่ ...',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'ระดับ ${state.quizLevel}',
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ]),
                  ),
                  const FlipCardProvider(),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    height: 200,
                    // color: Colors.amber,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 145,
                            height: 70,
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('กำหนด')),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 145,
                            height: 70,
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('ทดลอง')),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 145,
                            height: 70,
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('เปรียบเทียบ')),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 145,
                            height: 70,
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('จำกัด')),
                          )
                        ],
                      )
                    ]),
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
