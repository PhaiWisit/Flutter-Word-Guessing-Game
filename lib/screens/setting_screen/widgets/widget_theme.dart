import 'package:flutter/material.dart';
import '../../../blocs/blocs_export.dart';

class WidgetTheme extends StatelessWidget {
  final int themeId;
  final String themeTitle;
  final List<Color> themeColor;
  const WidgetTheme({
    super.key,
    required this.themeId,
    required this.themeTitle,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<SettingBloc>().add(OnThemeSelected(themeSelected: themeId));
          },
          child: Container(
            width: double.infinity,
            height: 40,
            color: state.themeSelected == themeId ? Colors.black12 : Colors.white54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 5),
                    Text(themeTitle,style: Theme.of(context).textTheme.titleSmall,),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: themeColor[0],
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          color: themeColor[1],
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          color: themeColor[2],
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          color: themeColor[3],
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          color: themeColor[4],
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    state.themeSelected == themeId
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                    const SizedBox(width: 5),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
