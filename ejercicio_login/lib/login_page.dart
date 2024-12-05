import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFE62F16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Image(
                    image: AssetImage('images/path_logo.png'),
                    width: 300,
                    height: 100,
                  ),
                  const Text(
                    'Beautiful, Private Sharing',
                    style: TextStyle(
                      color: Color.fromRGBO(224, 224, 224, 0.808),
                      fontSize: 15,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child:  const Text('Sign Up')),
                  Column(
                    children: [
                      const Text('Already have Path account?'),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Log In'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
