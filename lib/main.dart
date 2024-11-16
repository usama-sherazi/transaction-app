import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Smarter, Save More',
      home: SpendSmarterScreen(),
    );
  }
}

class SpendSmarterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://s3-alpha-sig.figma.com/img/7c5c/258a/8e5e2e65bc4ac3777434dbe5f741c143?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=DMFFCM-99E5g5N5fcbbtII-VwMX4DP9r5hHPliGzgHRZzLiamWeopJY3iP88Kvj87Av7ZSZCHzEX0uxJAdYsBpVSpzeMvPWxW5Xe66vZG0U4i2cYZY0l25x1ZhNCJeLk0DVqr9BdPpypc43H-4hR7GdCkpVSXBr4Rcrjvp0VFty2WiDrW2KDi4ARsCP8YIAeEnhw4MzGkoHBl~5ihhIx~8qQGenlxsyiIHTNalXiUBAGM~q8HOiXJh6k25ezQq8ynG9Xxr~cYcKWAsvgWmyo5XKgcLsb3znoQ5MsHNt6FFzm~kbdM3kYyz2CRaoOPwfVndCb4vFNwEFnlQTGfWvHpg__',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Spend Smarter\nSave More',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the "Get Started" screen
              },
              child: const Text('Get Started'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigate to the "Log In" screen
              },
              child: const Text('Already Have Account? Log In'),
            ),
          ],
        ),
      ),
    );
  }
}