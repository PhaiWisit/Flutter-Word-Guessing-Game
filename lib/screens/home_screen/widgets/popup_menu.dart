import 'package:flutter/material.dart';

import '../../about_screen/about_screen.dart';
import '../../setting_screen/setting_screen.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'setting',
          child: TextButton.icon(
            onPressed: null,
            icon: const Icon(Icons.settings),
            label: const Text('Setting'),
          ),
          // onTap: () {
          //   Navigator.of(context).pushNamed(SettingScreen.id);
          // },
        ),
        PopupMenuItem(
          value: 'about',
          child: TextButton.icon(
            onPressed: null,
            icon: const Icon(Icons.info_outline),
            label: const Text('About Application'),
          ),
        ),
      ],onSelected: (value) {
        if(value == 'setting'){
          Navigator.of(context).pushNamed(SettingScreen.id);
        }else if(value == 'about'){
          Navigator.of(context).pushNamed(AboutScreen.id);
        }
      },
    );
  }
}