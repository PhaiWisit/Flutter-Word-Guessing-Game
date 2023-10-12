import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:word_test/database/vocab_service.dart';
import 'package:word_test/models/vocab_model.dart';
import '../../blocs/blocs_export.dart';
import '../../main.dart';
import '../setting_screen/setting_screen.dart';
// import 'package:audioplayers/audioplayers.dart';

class TestScreen extends StatelessWidget {
  static const id = 'test_screen';
  TestScreen({super.key});

  // final dbHelper = DatabaseHelper.instance;

  // void _queryAll() async{
  //  final allRows = await dbHelper.queryAllRowAsJson();
  //  log("มีข้อมูลทั้งหมดใน table");

  // //  log(allRows);
  //  List<LevelModel> vocab = levelModelFromJson(allRows);
  // //  List<VocabModel> vocab = vocabModelFromJson('[{"vocab_id": 1, "quiz_id": 1, "level_id": 1, "vocab_eng": "straight", "vocab_tha": "ตรง", "vocab_meaning": "straight - not curved or bent; in a direct line", "vocab_type": "adj", "vocab_choice": "ความแข็งแกร่ง/ยืด/เฉียด", "vocab_correct_count": 0, "vocab_wrong_count": 0}]');
  //  log(vocab[4].levelDes);
  // //  allRows.forEach((row)=>log(row.toString()));

  // }

  void _test() async {
    VocabService vocabService = VocabService();
    List<VocabModel> vocabList = await vocabService.getRandomVocabList();
    // log(quizList[1].quizName);
    for (int i = 0; i < vocabList.length; i++) {
      log('${i + 1} ${vocabList[i].vocabEng}');
    }
  }

  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      // 'your_channel_description',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Daily Quiz!',
      'สามารถเข้าทำแบบทดสอบรายวันของคุณได้แล้ว',
      platformChannelSpecifics,
    );
  }

  // final AudioPlayer _audioPlayer = AudioPlayer();

  // Future<void> _playAudioFromAssets() async {
  //   await _audioPlayer.play(AssetSource('sounds/music.mp3'));
  // }

  // Future<void> _stopAudio() async {
  //   await _audioPlayer.stop();
  // }

  @override
  Widget build(BuildContext context) {
    _test();

    // AudioPlayer player = AudioPlayer();

    // dbHelper.database;
    // _queryAll();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SettingScreen.id);
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              // context.read<SettingBloc>().add(PlayMusic());
                            },
                            icon: const Icon(Icons.play_arrow)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.pause)),
                        IconButton(
                            onPressed: () {
                              // context.read<SettingBloc>().add(StopMusic());
                            },
                            icon: const Icon(Icons.stop)),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: _showNotification,
                        child: Text('Test Notification')),
                    Text('labelSmall',
                        style: Theme.of(context).textTheme.labelSmall),
                    Text('labelMedium',
                        style: Theme.of(context).textTheme.labelMedium),
                    Text('labelLarge',
                        style: Theme.of(context).textTheme.labelLarge),
                    Text('bodySmall',
                        style: Theme.of(context).textTheme.bodySmall),
                    Text('bodyMedium',
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text('bodyLarge',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('titleSmall',
                        style: Theme.of(context).textTheme.titleSmall),
                    Text('titleMedium',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('titleLarge',
                        style: Theme.of(context).textTheme.titleLarge),
                    Text('headlineSmall',
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text('headlineMedium',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text('headlineLarge',
                        style: Theme.of(context).textTheme.headlineLarge),
                    Text('displaySmall',
                        style: Theme.of(context).textTheme.displaySmall),
                    Text('displayMedium',
                        style: Theme.of(context).textTheme.displayMedium),
                    Text('displayLarge',
                        style: Theme.of(context).textTheme.displayLarge),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
