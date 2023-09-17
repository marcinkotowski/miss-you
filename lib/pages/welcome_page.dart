import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:miss_you/pages/login_page.dart';
import 'package:miss_you/pages/registration_page.dart';
import 'package:miss_you/theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const String _imagePath = 'assets/paper_airplane.png';

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
                      _imagePath,
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
                        MaterialPageRoute<LoginPage>(
                          builder: (context) => const LoginPage(),
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
                        MaterialPageRoute<RegistrationPage>(
                          builder: (context) => const RegistrationPage(),
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
