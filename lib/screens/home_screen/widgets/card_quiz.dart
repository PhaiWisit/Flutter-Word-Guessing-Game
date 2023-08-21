// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../blocs/blocs_export.dart';
import '../../quiz_screen/quiz_screen.dart';

class CardQuiz extends StatelessWidget {
  final int level;
  final String levelDes1;
  final String levelDes2;
  final IconData icon;
  const CardQuiz({
    Key? key,
    required this.level,
    required this.levelDes1,
    required this.levelDes2,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          .add(ChooseLevel(level: level));
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
                              child: Icon(
                                icon,
                                size: 80,
                              )),
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
                                Text("ระดับ $levelDes1",
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คำอธิบาย'),
                                      content: Text(levelDes2),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'ปิด'),
                                          child: Text('ปิด',style: Theme.of(context).textTheme.titleMedium,),
                                        ),
                                      ],
                                    ),
                                  ),
                              icon: const Icon(Icons.info)),
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
