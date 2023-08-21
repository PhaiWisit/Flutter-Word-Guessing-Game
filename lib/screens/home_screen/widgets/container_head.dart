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
      child: Stack(
        children: [
          BlocBuilder<SettingBloc, SettingState>(
            builder: (context, state) {
              ImageProvider<Object> coverImage = const ExactAssetImage(AppImages.coverDefault);
              final int themeId = state.themeSelected;
              
              switch(themeId){
                case 1: coverImage = const ExactAssetImage(AppImages.coverDefault);
                break;
                case 2: coverImage = const ExactAssetImage(AppImages.coverDark);
                break;
                case 3: coverImage = const ExactAssetImage(AppImages.coverColorFul);
                break;
                case 4: coverImage = const ExactAssetImage(AppImages.coverCute);
                break;
                default: coverImage = const ExactAssetImage(AppImages.coverDefault);
                break;
              }

              return Container(
                height: widgetHeight,
                width: double.infinity,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: coverImage,
                      fit: BoxFit.fitHeight),
                ),
                child: BackdropFilter(
                  filter: 
                  ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed(TestScreen.id);
              }, child: Text('TEST')),
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
