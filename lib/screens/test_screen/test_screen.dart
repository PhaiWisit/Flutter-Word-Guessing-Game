import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TestScreen extends StatelessWidget {
  static const id = 'test_screen';
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('labelSmall', style: Theme.of(context).textTheme.labelSmall),
                Text('labelMedium',
                    style: Theme.of(context).textTheme.labelMedium),
                Text('labelLarge', style: Theme.of(context).textTheme.labelLarge),
                Text('bodySmall', style: Theme.of(context).textTheme.bodySmall),
                Text('bodyMedium', style: Theme.of(context).textTheme.bodyMedium),
                Text('bodyLarge', style: Theme.of(context).textTheme.bodyLarge),
                Text('titleSmall', style: Theme.of(context).textTheme.titleSmall),
                Text('titleMedium',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('titleLarge', style: Theme.of(context).textTheme.titleLarge),
                Text('headlineSmall',
                    style: Theme.of(context).textTheme.headlineSmall),
                Text('headlineMedium',
                    style: Theme.of(context).textTheme.headlineMedium),
                Text('headlineLarge',
                    style: Theme.of(context).textTheme.headlineLarge),
                Text('displaySmall',
                    style: Theme.of(context).textTheme.displaySmall),
                Text('displayMedium',
                    style: Theme.of(context).textTheme.displayMedium),
                Text('displayLarge',
                    style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
