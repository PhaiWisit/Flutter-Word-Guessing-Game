import 'package:flutter/material.dart';

class SettingSound extends StatelessWidget {
  const SettingSound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool _musicSwitchValue = true;
    return Container(
      width: double.infinity,
      height: 130,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 4),
                    Text(
                      'Music Sound',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Icon(Icons.volume_up_outlined),
                  ],
                ),

                // Slider(
                //   value: 0,
                //   onChanged: (value) {},
                // ),
                Switch(
                    // activeColor: Colors.amber,
                    // activeTrackColor: Colors.cyan,
                    // inactiveThumbColor: Colors.blueGrey.shade600,
                    // inactiveTrackColor: Colors.grey.shade400,
                    splashRadius: 50.0,
                    value: _musicSwitchValue,
                    onChanged: (value) {}),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 4),
                Text(
                  'Effect Sound',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Icon(Icons.volume_up_outlined),
                Slider(
                  value: 0,
                  onChanged: (value) {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
