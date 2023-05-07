//Credit ****
//Feel free to use the code in your projects but do not forget
//to give me the credits adding my app (Flutter Animation Gallery)
//where you are gonna use it.

//------------------------------------------

import 'package:flutter/material.dart';
import 'package:word_test/blocs/blocs_export.dart';
import 'package:word_test/screens/list_screen/list_screen.dart';

class ButtonQuiz extends StatefulWidget {
  // final double width;
  // final double height;
  final int level;
  final IconData icon;

  const ButtonQuiz({
    super.key,
    // required this.width,
    // required this.height,
    required this.level,
    required this.icon,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ButtonQuizState createState() => _ButtonQuizState();
}

class _ButtonQuizState extends State<ButtonQuiz> with TickerProviderStateMixin {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.8;
    double height = 100;
    String levelText = '';
    
    switch(widget.level){
      case 1: levelText = 'อนุบาล';
      break;
      case 2: levelText = 'ประถม';
      break;
      case 3: levelText = 'มัธยม';
      break;
      case 4: levelText = 'ปริญญา';
      break;
      case 5: levelText = 'หมอลำ';
      break;
      default: levelText = '';
      break;
    }
    

    return Center(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHighlightChanged: (value) {
          setState(() {
            isTapped = value;
          });
        },
        onTap: () async {
          context
              .read<AppBlocBloc>()
              .add(ChooseQuizLevel(quizLevel: widget.level));
          Navigator.of(context).pushNamed(ListScreen.id);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          height: isTapped ? height : height + 5,
          width: isTapped ? width : width + 10,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
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
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        widget.icon,
                        size: 80,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Text('Level ${widget.level}',style: const TextStyle(fontSize: 18),),
                          Text('คำศัพท์ระดับ$levelText',style: const TextStyle(fontSize: 16),),
                        ],
                      ),
                      
                    ],
                  ),
                  const Text('จำนวน 20 '),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
