import 'package:flutter/material.dart';

class SettingSound extends StatelessWidget {
  const SettingSound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.black12,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              // color: Colors.amber,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Text('Music Sound'),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.volume_up_outlined),
                  Slider(
                    value: 0,
                    onChanged: (value) {},
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 60,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Text('Effect Sound'),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.volume_up_outlined),
                  Slider(
                    value: 0,
                    onChanged: (value) {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}