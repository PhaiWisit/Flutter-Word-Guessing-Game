import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlipCardProvider extends StatelessWidget {
  const FlipCardProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 250,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          height: 500,
          width: 380,
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Front', style: Theme.of(context).textTheme.headline1),
              Text('Click here to flip back',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
        back: Container(
          height: 500,
          width: 380,
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Back', style: Theme.of(context).textTheme.headline1),
              Text('Click here to flip front',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  
  }
}
