
import 'package:flutter/material.dart';

class AboutApplication extends StatelessWidget {
  const AboutApplication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About Application',style: Theme.of(context).textTheme.titleSmall,),
              const Divider(),
              Text('Application Name : English Words Test',style: Theme.of(context).textTheme.titleSmall,),
              Text('Number of words : 3000',style: Theme.of(context).textTheme.titleSmall,),
              Text('Version : 1.0.5',style: Theme.of(context).textTheme.titleSmall,),
              Text('Developer : Phai Software Solution',style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(height: 20),
              Text('Contact',style: Theme.of(context).textTheme.titleSmall,),
              const Divider(),
              Text('Email : w.phai@hotmail.com',style: Theme.of(context).textTheme.titleSmall,),
              Text('Website : www.phaisoft.com',style: Theme.of(context).textTheme.titleSmall,),
            ]),
      ),
    );
  }
}

