import 'package:audioplayers/audioplayers.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../../blocs/blocs_export.dart';

// ignore: must_be_immutable
class FlipCardProvider extends StatefulWidget {
  String vocabEng;
  String vocabType;
  String vocabMeaning;
  CardSide cardSide;

  FlipCardProvider({
    Key? key,
    required this.vocabEng,
    required this.vocabType,
    required this.vocabMeaning,
    required this.cardSide,
  }) : super(key: key);

  @override
  State<FlipCardProvider> createState() => _FlipCardProviderState();
}

class _FlipCardProviderState extends State<FlipCardProvider> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    if (cardKey.currentState != null) {
      if (!cardKey.currentState!.isFront) {
        setState(() {
          cardKey.currentState?.toggleCard();
        });
      }
    }

    double cardWidth = 300;
    double cardHeight = 400;
    int flipSpeed = 250;
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: const Color(0x00000000),
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return FlipCard(
            key: cardKey,
            direction: FlipDirection.HORIZONTAL,
            side: CardSide.FRONT,
            speed: flipSpeed,
            onFlip: () async {
              AudioPlayer audioPlayer = AudioPlayer();
              state.effectIsOn
                  ? await audioPlayer.play(AssetSource('sounds/effect_2.mp3'))
                  : null;
            },
            onFlipDone: (status) async {},
            front: Container(
              width: cardWidth,
              height: cardHeight,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Theme.of(context).toggleableActiveColor,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(widget.vocabEng,
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text('(${widget.vocabType}.)',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 20,
                          // color: Colors.amber,
                          child: Text('(ดูคำใบ้)',style: Theme.of(context).textTheme.titleSmall,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            back: Container(
              width: cardWidth,
              height: cardHeight,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Theme.of(context).toggleableActiveColor,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('ความหมายภาษาอังกฤษ',
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 10),
                    Text(widget.vocabMeaning,
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
