import 'package:flutter/material.dart';
import 'package:word_test/models/level_model.dart';
import 'package:word_test/screens/home_screen/widgets/card_daily_quiz.dart';
import 'package:word_test/screens/home_screen/widgets/card_quiz.dart';
import 'package:word_test/screens/home_screen/widgets/container_head.dart';
import '../../blocs/blocs_export.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final List<AppLifecycleState> _stateHistoryList = <AppLifecycleState>[];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (WidgetsBinding.instance.lifecycleState != null) {
      _stateHistoryList.add(WidgetsBinding.instance.lifecycleState!);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      BlocProvider.of<SettingBloc>(context).add(PauseMusic());
    } else if (state == AppLifecycleState.resumed) {
      BlocProvider.of<SettingBloc>(context).add(ResumeMusic());
    }
  }

  IconData levelIcon(int level) {
    switch (level) {
      case 1:
        return Icons.looks_one;
      case 2:
        return Icons.looks_two;
      case 3:
        return Icons.looks_3;
      case 4:
        return Icons.looks_4;
      case 5:
        return Icons.looks_5;
      case 6:
        return Icons.looks_6;
      default:
        return Icons.question_mark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            if (state.musicIsOn) {
              context.read<SettingBloc>().add(PlayMusic());
            } else {
              context.read<SettingBloc>().add(StopMusic());
            }
            return SingleChildScrollView(
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
                              return const Center(
                                  child: Text("Error when load level list."));
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
                                  const SizedBox(height: 10),
                                  const CardDailyQuiz(),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'All Quiz',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
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
                                      levelDes1: levelList[i].levelDes1,
                                      levelDes2: levelList[i].levelDes2,
                                      icon: levelIcon(levelList[i].levelId),
                                    ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              );
                            }
                            return const Text(
                                'Not Support On Web or some error.');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
