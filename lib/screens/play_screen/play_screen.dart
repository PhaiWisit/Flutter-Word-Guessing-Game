import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:word_test/blocs/blocs_export.dart';
import 'package:word_test/models/vocab_model.dart';
import 'package:word_test/screens/play_screen/widgets/flip_card.dart';
import 'package:word_test/screens/play_screen/widgets/score_summary.dart';

// ignore: must_be_immutable
class PlayScreen extends StatefulWidget {
  static const id = 'play_screen';
  int index = 0;
  int correctNumber = 0;
  List<int> wrongWordIndex = [];
  int quizId;

  PlayScreen({
    Key? key,
    required this.quizId,
  }) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  List<String> _switchPositionChoice(VocabModel vocab) {
    List<String> choiceText =
        '${vocab.vocabChoice}/${vocab.vocabTha}'.split("/");
    choiceText.shuffle();
    if (kDebugMode) {
      print(choiceText);
    }
    return choiceText;
  }

  bool _isCorrect(List<VocabModel> vocabList, String answer, String answer2) {
    if (answer == answer2) {
      setState(() {
        if (widget.index < 21) {
          widget.index++;
        }
      });
      widget.correctNumber++;
      log('index = ${widget.index}');
      log('correct = ${widget.correctNumber}');
      return true;
    } else {
      setState(() {
        if (widget.index < 21) {
          widget.index++;
        }
      });
      widget.wrongWordIndex.add(widget.index - 1);
      log('Incorrect ${widget.wrongWordIndex.toString()}');
      return false;
    }
  }

  CardSide cardSide = CardSide.FRONT;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: BlocBuilder<AppBlocBloc, AppBlocState>(
              builder: (context, state) {
                int level = state.level;
                int quiz = state.quiz;
                return BlocProvider(
                  create: (context) =>
                      VocabBloc()..add(GetVocabList(state.level, state.quiz)),
                  child: BlocBuilder<VocabBloc, VocabState>(
                    builder: (context, state) {
                      if (state is VocabLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is VocabErrorState) {
                        return const Center(
                            child: Text("Error when load quiz list."));
                      }
                      if (state is VocabLoadedState) {
                        List<VocabModel> vocabList = state.vocabList;
                        if (vocabList.isNotEmpty && widget.index < 20) {
                          //test = 0 / default = 20
                          List<String> choiceText =
                              _switchPositionChoice(vocabList[widget.index]);
                          String answer = vocabList[widget.index].vocabTha;
                          String choice1 = choiceText[0];
                          String choice2 = choiceText[1];
                          String choice3 = choiceText[2];
                          String choice4 = choiceText[3];

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'แบบทดสอบที่ $quiz',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        'ระดับ $level',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      )
                                    ]),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '${widget.index + 1}/20',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              FlipCardProvider(
                                vocabEng: vocabList[widget.index].vocabEng,
                                vocabType: vocabList[widget.index].vocabType,
                                vocabMeaning:
                                    vocabList[widget.index].vocabMeaning,
                                cardSide: cardSide,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 300,
                                height: 200,
                                child: BlocBuilder<SettingBloc, SettingState>(
                                  builder: (context, state) {
                                    AudioPlayer audioPlayer = AudioPlayer();

                                    return Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //Button Choice 1
                                          SizedBox(
                                            width: 145,
                                            height: 70,
                                            child: ElevatedButton(
                                                onPressed: () async {
                                                  _isCorrect(
                                                    vocabList,
                                                    answer,
                                                    choice1,
                                                  );
                                                  state.effectIsOn
                                                      ? await audioPlayer.play(
                                                          AssetSource(
                                                              'sounds/effect_1.mp3'))
                                                      : null;
                                                },
                                                child: Text(choice1)),
                                          ),
                                          const SizedBox(width: 10),

                                          //Button Choice 2
                                          SizedBox(
                                            width: 145,
                                            height: 70,
                                            child: ElevatedButton(
                                                onPressed: () async {
                                                  _isCorrect(
                                                    vocabList,
                                                    answer,
                                                    choice2,
                                                  );
                                                  state.effectIsOn
                                                      ? await audioPlayer.play(
                                                          AssetSource(
                                                              'sounds/effect_1.mp3'))
                                                      : null;
                                                },
                                                child: Text(choice2)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //Button Choice 3
                                          SizedBox(
                                            width: 145,
                                            height: 70,
                                            child: ElevatedButton(
                                                onPressed: () async {
                                                  _isCorrect(
                                                    vocabList,
                                                    answer,
                                                    choice3,
                                                  );
                                                  state.effectIsOn
                                                      ? await audioPlayer.play(
                                                          AssetSource(
                                                              'sounds/effect_1.mp3'))
                                                      : null;
                                                },
                                                child: Text(choice3)),
                                          ),
                                          const SizedBox(width: 10),

                                          //Button Choice 4
                                          SizedBox(
                                            width: 145,
                                            height: 70,
                                            child: ElevatedButton(
                                                onPressed: () async {
                                                  _isCorrect(
                                                    vocabList,
                                                    answer,
                                                    choice4,
                                                  );
                                                  state.effectIsOn
                                                      ? await audioPlayer.play(
                                                          AssetSource(
                                                              'sounds/effect_1.mp3'))
                                                      : null;
                                                },
                                                child: Text(choice4)),
                                          )
                                        ],
                                      )
                                    ]);
                                  },
                                ),
                              )
                            ],
                          );
                        } else {
                          return ScoreSummary(
                            rebuildState: () {
                              setState(() {
                                widget.index = 0;
                                widget.correctNumber = 0;
                                widget.wrongWordIndex = [];
                              });
                            },
                            quizId: widget.quizId,
                            vocabList: vocabList,
                            correctNumber: widget.correctNumber,
                            wrongWordIndex: widget.wrongWordIndex,
                          );
                        }
                      }
                      return Container();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
