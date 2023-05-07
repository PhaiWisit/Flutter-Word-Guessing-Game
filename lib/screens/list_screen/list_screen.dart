import 'package:flutter/material.dart';
import 'package:word_test/screens/quiz_screen/quiz_screen.dart';

import '../../blocs/blocs_export.dart';

class ListScreen extends StatelessWidget {
  static const id = 'list_screen';
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(20, (i) => '$i');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
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
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: MediaQuery.of(context).size.height * 0.65,
                          // color: Colors.amber,
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: const Color(0xff764abc),
                                  child: Text(items[index]),
                                ),
                                title: Text('แบบทดสอบที่ ${items[index]}'),
                                subtitle: Text(
                                    'คำอธิบาย แบบทดสอบที่ ${items[index]}'),
                                trailing: Checkbox(
                                    onChanged: (value) {}, value: false),
                                    onTap: () {
                                      Navigator.of(context).pushNamed(QuizScreen.id);
                                    },
                              );
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
                        color: Colors.grey),
                    width: 160,
                    height: 50,
                    child: Center(child: Text('Level $level')),
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
