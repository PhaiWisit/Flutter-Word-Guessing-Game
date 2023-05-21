import 'dart:developer';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlipCardProvider extends StatelessWidget {
  const FlipCardProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = 300;
    double cardHeight = 400;
    int flipSpeed = 250;

    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: const Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: flipSpeed,
        onFlipDone: (status) {
          log(status.toString());
        },
        front: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 143, 223, 223),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Compare', style: Theme.of(context).textTheme.headlineLarge),
              Text('(v.)', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
        back: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 143, 223, 223),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('ความหมายภาษาอังกฤษ',style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                Text(
                    'To examine similarities and differences between two or more things',
                    style: Theme.of(context).textTheme.headlineSmall),
                // Text('Click here to flip front',
                // style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
