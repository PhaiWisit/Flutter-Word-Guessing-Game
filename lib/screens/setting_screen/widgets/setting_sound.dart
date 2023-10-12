import 'package:flutter/material.dart';
import '../../../blocs/blocs_export.dart';

class SettingSound extends StatelessWidget {
  const SettingSound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return Column(
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
                        const SizedBox(width: 4),
                        const Icon(Icons.volume_up_outlined),
                      ],
                    ),
                    Switch(
                        splashRadius: 50.0,
                        value: state.musicIsOn,
                        onChanged: (value) {
                          if (state.musicIsOn) {
                            context.read<SettingBloc>().add(StopMusic());
                            // log(state.musicIsOn.toString());
                          } else {
                            context.read<SettingBloc>().add(PlayMusic());
                            // log(state.musicIsOn.toString());
                          }
                        }),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 4),
                        Text(
                          'Effect Sound',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.volume_up_outlined),
                      ],
                    ),
                    Switch(
                      splashRadius: 50.0,
                        value: state.effectIsOn,
                        onChanged: (value) {
                          if (state.effectIsOn) {
                            context.read<SettingBloc>().add(EffectOff());
                            
                          } else {
                            context.read<SettingBloc>().add(EffectOn());
                            
                          }
                        }),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
