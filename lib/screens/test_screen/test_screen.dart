import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:word_test/models/level_model.dart';
import 'package:word_test/models/vocab_model.dart';

import '../../database/database_helper.dart';
import '../setting_screen/setting_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    

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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('labelSmall',
                    style: Theme.of(context).textTheme.labelSmall),
                Text('labelMedium',
                    style: Theme.of(context).textTheme.labelMedium),
                Text('labelLarge',
                    style: Theme.of(context).textTheme.labelLarge),
                Text('bodySmall', style: Theme.of(context).textTheme.bodySmall),
                Text('bodyMedium',
                    style: Theme.of(context).textTheme.bodyMedium),
                Text('bodyLarge', style: Theme.of(context).textTheme.bodyLarge),
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
        ),
      ),
    );
  }
}
