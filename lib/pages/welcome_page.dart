import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  final String imagePath = "assets/paper_airplane.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropShadow(
                    color: Colors.black,
                    blurRadius: 1.5,
                    offset: const Offset(0.0, 4.0),
                    opacity: 0.15,
                    child: Image.asset(
                      imagePath,
                      height: 150,
                    ),
                  ),
                  const Text(
                    "MISS YOU",
                  ),
                  const Text(
                    "Send a reminder your love",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Login"),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Register"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
