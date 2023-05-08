import 'package:flutter/material.dart';
import 'package:word_test/screens/setting_screen/widgets/about_application.dart';
import 'package:word_test/screens/setting_screen/widgets/setting_sound.dart';
import 'package:word_test/screens/setting_screen/widgets/setting_theme.dart';
import 'package:word_test/utils/app_colors.dart';
import 'widgets/setting_notification.dart';
import 'widgets/widget_theme.dart';

class SettingScreen extends StatelessWidget {
  static const id = 'setting_screen';

  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Theme',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(),
              const SettingTheme(),
              const SizedBox(height: 20),
              Text(
                'Sound',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(),
              const SettingSound(),
              const SizedBox(height: 20),
              Text(
                'Notification',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(),
              const SettingNotification(),
              const SizedBox(height: 20),
              Text(
                'About Application',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(),
              const AboutApplication(),
            ],
          ),
        ),
      ),
    );
  }
}
