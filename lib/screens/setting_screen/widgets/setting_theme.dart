import 'package:flutter/material.dart';
import 'package:word_test/screens/setting_screen/widgets/widget_theme.dart';

import '../../../utils/app_colors.dart';

class SettingTheme extends StatelessWidget {
  const SettingTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: const [
            WidgetTheme(
              themeId: 1,
              themeTitle: 'Default Theme',
              themeColor: AppColors.defaultTheme,
            ),
            SizedBox(height: 10),
            WidgetTheme(
              themeId: 2,
              themeTitle: 'Dark Theme',
              themeColor: AppColors.dartTheme,
            ),
            SizedBox(height: 10),
            WidgetTheme(
              themeId: 3,
              themeTitle: 'ColorFul Theme',
              themeColor: AppColors.colorFulTheme,
            ),
            SizedBox(height: 10),
            WidgetTheme(
              themeId: 4,
              themeTitle: 'Cute Theme',
              themeColor: AppColors.cuteTheme,
            ),
          ],
        ),
      ),
    );
  }
}
