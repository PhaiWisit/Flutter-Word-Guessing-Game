import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:word_test/screens/test_screen/test_screen.dart';
import 'package:word_test/utils/app_images.dart';
import '../../../blocs/blocs_export.dart';
import '../../setting_screen/setting_screen.dart';

class ContainerHead extends StatelessWidget {
  const ContainerHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double widgetHeight = 300;

    return SizedBox(
      height: widgetHeight,
      width: double.infinity,
      // color: Colors.green,
      child: Stack(
        children: [
          BlocBuilder<SettingBloc, SettingState>(
            builder: (context, state) {
              ImageProvider<Object> cover_image = ExactAssetImage(AppImages.coverDefault);
              final int themeId = state.themeSelected;
              
              switch(themeId){
                case 1: cover_image = const ExactAssetImage(AppImages.coverDefault);
                break;
                case 2: cover_image = const ExactAssetImage(AppImages.coverDark);
                break;
                case 3: cover_image = const ExactAssetImage(AppImages.coverColorFul);
                break;
                case 4: cover_image = const ExactAssetImage(AppImages.coverCute);
                break;
                default: cover_image = const ExactAssetImage(AppImages.coverDefault);
                break;
              }

              return Container(
                height: widgetHeight,
                width: double.infinity,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: cover_image,
                      fit: BoxFit.fitWidth),
                ),
                child: BackdropFilter(
                  filter: 
                  // themeId == 1? ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0) : 
                  ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
                // Image.asset(
                //   AppImages.englishBooks,
                //   fit: BoxFit.fitWidth,
                // ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () {
                    Navigator.of(context).pushNamed(TestScreen.id);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_border,
                        size: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'RATE',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     Navigator.of(context).pushNamed(AboutScreen.id);
              //   },
              //   splashColor: Colors.transparent,
              //   highlightColor: Colors.transparent,
              //   hoverColor: Colors.transparent,
              //   icon: const Icon(
              //     Icons.info_outline,
              //     size: 30,
              //     color: Color.fromARGB(255, 183, 37, 37),
              //   ),
              // ),
              SizedBox(
                width: 70,
                height: 50,
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    Navigator.of(context).pushNamed(SettingScreen.id);
                  },
                  icon: const Icon(
                    Icons.settings,
                    shadows: <Shadow>[
                      Shadow(color: Colors.black87, blurRadius: 5.0)
                    ],
                    size: 50,
                    // color: Color.fromARGB(255, 183, 37, 37),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
