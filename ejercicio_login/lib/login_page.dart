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
                  Image.asset('images/path_logo.png', width: 200, height: 100),
                  const Text(
                    'Beautiful, Private Sharing',
                    style: TextStyle(
                      color: Color.fromRGBO(224, 224, 224, 0.808),
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 200),
                    child: SizedBox(
                      width: 300,
                      child: FloatingActionButton(
                          onPressed: () {},
                          elevation: 0,
                          child: const Text('Sign up',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFE62F16)))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text('Already have Path account?',
                        style: TextStyle(
                          color: Color.fromRGBO(224, 224, 224, 0.808),
                          fontSize: 15,
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                              color: Color.fromRGBO(224, 224, 224, 0.808)),
                        )),
                  ),
                  SizedBox(
                    width: 300,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'By using Path, you agree to our ',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(129, 197, 197, 197)),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 110, 255),
                                  decoration: TextDecoration.underline)),
                          TextSpan(text: ' and '),
                          TextSpan(
                              text: 'Privace Policy',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 110, 255),
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),
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
