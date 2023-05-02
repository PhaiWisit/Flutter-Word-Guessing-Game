//Feel free to use the code in your projects but do not forget to give me the credits adding my app (Flutter Animation Gallery) where you are gonna use it.

//------------------------------------------
import 'package:flutter/material.dart';

class ButtonDailyQuiz extends StatefulWidget {
  final double width;
  final double height;

  const ButtonDailyQuiz({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  _ButtonDailyQuizState createState() => _ButtonDailyQuizState();
}

class _ButtonDailyQuizState extends State<ButtonDailyQuiz>
    with TickerProviderStateMixin {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onHighlightChanged: (value) {
          setState(() {
            isTapped = value;
          });
        },
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          height: isTapped ? widget.height : widget.height+5,
          width: isTapped ? widget.width : widget.width+10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 30,
                offset: const Offset(3, 7),
              ),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star_border_purple500_outlined,size: 80,),
                const SizedBox(width: 10,),
                Text(
                  'Daily Quiz',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
