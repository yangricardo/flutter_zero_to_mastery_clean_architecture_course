import 'package:advicer_app/application/core/services/theme.service.dart';
import 'package:advicer_app/application/pages/advice/widgets/get-advices.button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Advicer', style: themeData.textTheme.headlineSmall),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(children: const [
          Expanded(child: Center(child: Placeholder())),
          SizedBox(height: 200, child: Center(child: GetAdvicesButton()))
        ]),
      ),
    );
  }
}
