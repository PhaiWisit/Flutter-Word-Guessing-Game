import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const id = 'about_screen';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Application'),
      ),
      body: const Center(
        child: Text('About Page'),
      ),
    );
  }
}
