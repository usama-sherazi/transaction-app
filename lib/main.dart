import 'package:flutter/material.dart';

import 'MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Spend Smarter, Save More',
      debugShowCheckedModeBanner: false,
      home: SpendSmarterScreen(),
    );
  }
}

class SpendSmarterScreen extends StatelessWidget {
  // Define tealGreen color using Flutter's Colors.
  final Color tealGreen = Colors.teal;

  const SpendSmarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
"assets/mainlogoPNG.PNG"      ,
              width: 450,
              height: 400,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
            Text(
              'Spend Smarter',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: tealGreen,
                height: 1.2,
              ),
            ),
            Text(
              'Save More',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: tealGreen,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );               },
                style: ElevatedButton.styleFrom(
                  backgroundColor: tealGreen,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5, // Add shadow to the button
                  shadowColor: Colors.black.withOpacity(0.25), // Customize shadow color
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigate to Login screen
              },
              child: RichText(
                text: TextSpan(
                  text: 'Already Have Account? ',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'Log In',
                      style: TextStyle(
                        color: tealGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
