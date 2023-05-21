import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:word_test/models/level_model.dart';
import 'package:word_test/screens/home_screen/widgets/card_daily_quiz.dart';
import 'package:word_test/screens/home_screen/widgets/card_quiz.dart';
import 'package:word_test/screens/home_screen/widgets/container_head.dart';

import '../../blocs/blocs_export.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const ContainerHead(),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: BlocProvider(
                    create: (context) => LevelBloc()..add(GetLevelList()),
                    child: BlocBuilder<LevelBloc, LevelState>(
                      builder: (context, state) {
                        if (state is LevelLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is LevelErrorState) {
                          return const Center(child: Text("Error when load level list."));
                        }

                        if (state is LevelLoadedState) {
                          List<LevelModel> levelList = state.levelList;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 230,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  // Text(
                                  //   '    User Name',
                                  //   style: TextStyle(fontSize: 30),
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const CardDailyQuiz(),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'All Quiz',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              const SizedBox(height: 10),
                              for (int i = 0; i < levelList.length; i++)
                                CardQuiz(
                                  level: levelList[i].levelId,
                                  icon: Icons.looks_one,
                                ),
                            
                              Container(
                                height: 60,
                                color: Color.fromARGB(255, 186, 186, 186),
                                child: const Center(child: Text('พื้นที่โฆษณา')),
                              ),
                              const SizedBox(height: 10,)
                            ],
                          );
                        }
                        return const Text('Not Support On Web or some error.');
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
