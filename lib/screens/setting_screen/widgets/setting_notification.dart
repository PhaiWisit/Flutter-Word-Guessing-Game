import 'package:flutter/material.dart';
class SettingNotification extends StatelessWidget {
  const SettingNotification({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
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
              children: [
                const SizedBox(width: 10),
                Text('Daily Notification',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(
                  width: 20,
                ),
                const Checkbox(value: false, onChanged: null)
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                Text('Set time',style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(width: 20),
                Text('08:00',style: Theme.of(context).textTheme.titleSmall,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}