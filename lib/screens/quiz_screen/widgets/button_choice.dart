//Feel free to use the code in your projects but do not forget to give me the credits adding my app (Flutter Animation Gallery) where you are gonna use it.

//------------------------------------------

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_test/blocs/blocs_export.dart';
import 'package:word_test/screens/quiz_screen/quiz_screen.dart';

class ButtonChoice extends StatefulWidget {
  final double width;
  final double height;
  final String title;

  const ButtonChoice({
    super.key,
    required this.width,
    required this.height,
    required this.title,
  });

  @override
  _ButtonChoiceState createState() => _ButtonChoiceState();
}

class _ButtonChoiceState extends State<ButtonChoice>
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
        onTap: () async {
          // context.read<AppBlocBloc>().add(ChooseQuizLevel(quiz_level: widget.level));
          // Navigator.of(context).pushNamed(QuizScreen.id);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          height: isTapped ? widget.height : widget.height + 5,
          width: isTapped ? widget.width : widget.width + 10,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
