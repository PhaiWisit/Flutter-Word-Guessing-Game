import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../blocs/blocs_export.dart';

class SettingScreen extends StatelessWidget {
  static const id = 'setting_screen';

  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body:  Center(
        child: BlocBuilder<AppBlocBloc, AppBlocState>(
              builder: (context, state) {
                return Switch(
                  value: state.switchTheme,
                  onChanged: (newValue) {
                    newValue 
                      ? context.read<AppBlocBloc>().add(const SwitchThemeApp(switchTheme: true))
                      : context.read<AppBlocBloc>().add(const SwitchThemeApp(switchTheme: false));
                  },
                );
              },
            ),
      ),
    );
  }
}
