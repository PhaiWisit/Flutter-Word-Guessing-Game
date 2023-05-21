import 'package:flutter/material.dart';
import 'package:word_test/screens/setting_screen/setting_screen.dart';

import '../../blocs/blocs_export.dart';
import 'widgets/quiz_list.dart';

class ListScreen extends StatelessWidget {
  static const id = 'list_screen';
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(20, (i) => '$i');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'รายการแบบทดสอบ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [IconButton(onPressed: () {
            Navigator.of(context).pushNamed(SettingScreen.id);
          }, icon: const Icon(Icons.settings))],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.1,
                  // color: Colors.green,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10,),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: MediaQuery.of(context).size.height * 0.65,
                          // color: Colors.amber,
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              int quizNumber = index + 1;
                              return QuizList(quizNumber: quizNumber);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1 - 25,
              right: MediaQuery.of(context).size.width * 0.5 - 80,
              child: BlocBuilder<AppBlocBloc, AppBlocState>(
                builder: (context, state) {
                  int level = context.read<AppBlocBloc>().state.quizLevel;
                  return Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color.fromARGB(255, 255, 221, 119)),
                    width: 160,
                    height: 50,
                    child: Center(
                        child: Text(
                      'Level $level',
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
