import 'package:flutter/material.dart';
import 'package:word_test/models/quiz_model.dart';
import 'package:word_test/screens/setting_screen/setting_screen.dart';
import '../../blocs/blocs_export.dart';
import 'widgets/quiz_list.dart';

class QuizScreen extends StatelessWidget {
  static const id = 'list_screen';
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            'รายการแบบทดสอบ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SettingScreen.id);
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.1,
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
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: BlocBuilder<AppBlocBloc, AppBlocState>(
                            builder: (context, state) {
                              int level = state.level;
                              // log(level.toString());
                              return BlocProvider(
                                create: (context) =>
                                    QuizBloc()..add(GetQuizList(level)),
                                child: BlocBuilder<QuizBloc, QuizState>(
                                  builder: (context, state) {
                                    if (state is QuizLoadingState) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (state is QuizErrorState) {
                                      return const Center(
                                          child: Text(
                                              "Error when load quiz list."));
                                    }
                                    if (state is QuizLoadedState) {
                                      List<QuizModel> quizList = state.quizList;
                                      return ListView.builder(
                                        itemCount: quizList.length,
                                        itemBuilder: (context, index) {
                                          return QuizList(
                                            quiz: quizList[index],
                                          );
                                        },
                                      );
                                    }
                                    return Container();
                                  },
                                ),
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
                  int level = context.read<AppBlocBloc>().state.level;
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Theme.of(context).appBarTheme.backgroundColor),
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
