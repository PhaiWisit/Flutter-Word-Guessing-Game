import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:word_test/blocs/blocs_export.dart';
import 'package:word_test/database/quiz_service.dart';
import 'package:word_test/screens/home_screen/home_screen.dart';
import '../../../models/vocab_model.dart';
import '../../../utils/app_theme.dart';

// ignore: must_be_immutable
class ScoreSummary extends StatelessWidget {
  final VoidCallback rebuildState;
  List<VocabModel> vocabList;
  int correctNumber;
  List<int> wrongWordIndex;
  int quizId;
  ScoreSummary({
    Key? key,
    required this.vocabList,
    required this.correctNumber,
    required this.wrongWordIndex,
    required this.rebuildState,
    required this.quizId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<VocabModel> wrongWordList = [];
    for (int i = 0; i < wrongWordIndex.length; i++) {
      wrongWordList.add(vocabList[wrongWordIndex[i]]);
    }
    log(quizId.toString());
    int rate = 0;

    if (correctNumber < 10) {
      rate = 0;
    } else if (correctNumber >= 10 && correctNumber < 15) {
      rate = 1;
    } else if (correctNumber >= 15 && correctNumber < 20) {
      rate = 2;
    } else if (correctNumber == 20) {
      rate = 3;
    }

    QuizService quizService = QuizService();
    quizService.updateScoreAndRate(quizId, correctNumber, rate);

    return Center(
      child: SingleChildScrollView(
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            Future<void>? audioFuture;
            if (state.effectIsOn) {
              final audioPlayer = AudioPlayer();
              audioFuture =
                  audioPlayer.play(AssetSource('sounds/effect_3.mp3'));
            }
            return FutureBuilder(builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error loading audio');
              } else {}

              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  wrongWordList.isEmpty
                      ? const SizedBox(
                          height: 100,
                        )
                      : const SizedBox(),
                  Text(
                    'Your Score !',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 180,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Theme.of(context).dividerColor),
                    child: Center(
                      child: Text('$correctNumber/20',
                          style: Theme.of(context).textTheme.headlineLarge),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  wrongWordList.isNotEmpty
                      ? Text(
                          'Wrong Word',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      : Container(),
                  wrongWordList.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: BlocBuilder<SettingBloc, SettingState>(
                            builder: (context, state) {
                              return Container(
                                width: double.infinity,
                                height: 500,
                                decoration: BoxDecoration(
                                    color: state.themeSelected ==
                                            AppThemes.appThemeData[
                                                AppTheme.darkTheme]
                                        ? Colors.black54
                                        : Colors.black12,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: ListView.builder(
                                    itemCount: wrongWordList.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: WrongWord(
                                          wrongWordList: wrongWordList,
                                          index: index,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                  wrongWordList.isEmpty
                      ? const SizedBox(
                          height: 50,
                        )
                      : const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            onPressed: rebuildState,
                            padding: const EdgeInsets.all(0.0),
                            icon: const Icon(
                              Icons.replay_circle_filled_sharp,
                              size: 55,
                            )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  HomeScreen.id,
                                  (Route<dynamic> route) => false);
                            },
                            child:
                                const Center(child: Text('กลับหน้าแบบทดสอบ'))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            });
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WrongWord extends StatelessWidget {
  List<VocabModel> wrongWordList;
  int index;
  WrongWord({
    Key? key,
    required this.wrongWordList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(wrongWordList[index].vocabEng),
            Text(wrongWordList[index].vocabTha),
          ],
        ),
      )),
    );
  }
}
