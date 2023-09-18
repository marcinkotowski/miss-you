import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:miss_you/screens/sign_in_screen.dart';
import 'package:miss_you/screens/sign_up_screen.dart';
import 'package:miss_you/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static String imagePath = 'assets/paper_airplane.png';
  static Page<dynamic> page() {
    return const MaterialPage(child: WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    offset: const Offset(0, 4),
                    opacity: 0.15,
                    child: Image.asset(
                      imagePath,
                      height: 160,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'MISS YOU',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Send a reminder your love',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: outlinedButtonStyle.copyWith(
                      minimumSize: MaterialStateProperty.all(
                        const Size(150, 45),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text('LOGIN'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    style: elevatedButtonStyle.copyWith(
                      minimumSize: MaterialStateProperty.all(
                        const Size(150, 45),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text('REGISTER'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
