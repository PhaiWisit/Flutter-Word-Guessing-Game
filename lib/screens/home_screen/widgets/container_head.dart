import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:word_test/utils/app_images.dart';
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
          Container(
            height: widgetHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(
                    AppImages.englishBooks,
                  ),
                  fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
            // Image.asset(
            //   AppImages.englishBooks,
            //   fit: BoxFit.fitWidth,
            // ),
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
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.star,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text('RATE'),
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
                    shadows: <Shadow>[Shadow(color: Colors.black87, blurRadius: 5.0)],
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
