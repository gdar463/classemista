import 'package:flutter/material.dart';
import 'package:my_classeviva/cvv/models/profile.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.profile});

  final Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title:
                Text("Buonasera, ${profile?.firstName} ${profile?.lastName}")),
        body: const Center(child: Text("magic")));
  }
}
