import 'package:flutter/material.dart';
import 'package:word_test/screens/setting_screen/widgets/setting_sound.dart';
import 'package:word_test/screens/setting_screen/widgets/setting_theme.dart';
import 'package:word_test/utils/app_colors.dart';
import 'widgets/widget_theme.dart';

class SettingScreen extends StatelessWidget {
  static const id = 'setting_screen';

  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Theme'),
              const Divider(),
              const SettingTheme(),
              const SizedBox(height: 20),
              const Text('Sound'),
              const Divider(),
              const SettingSound(),
              const SizedBox(height: 20),
              const Text('Notification'),
              const Divider(),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(width: 10),
                          Text('Notification in daily'),
                          SizedBox(
                            width: 20,
                          ),
                          Checkbox(value: false, onChanged: null)
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(width: 30),
                          Text('Set time'),
                          SizedBox(width: 20),
                          Text('08:00')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('About Application'),
              const Divider(),
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('About Application'),
                        Divider(),
                        Text('Application Name : English Words Test'),
                        Text('Number of words : 3000'),
                        Text('Version : 1.0.5'),
                        Text('Developer : Phai Software Solution'),
                        SizedBox(height: 20),
                        Text('Contact'),
                        Divider(),
                        Text('Email : w.phai@hotmail.com'),
                        Text('Website : www.phaisoft.com'),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
