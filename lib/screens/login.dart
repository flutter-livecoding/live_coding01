import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livecoding2/screens/widgets/my_button.dart';
import 'package:livecoding2/screens/widgets/text_field.dart';

import 'widgets/text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailOrNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscureText = false;
  bool remeberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 80),
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              loginImageSplash(context),
              loginForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginImageSplash(context) {
    return Expanded(
      child: Center(
        child: SizedBox(
          width: 300,
          child: Image.asset("assets/login.png"),
        ),
      ),
    );
  }

  Widget loginForm(context) {
    return Expanded(
      child: Center(
        child: Container(
          width: 550,
          height: 700,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: -5,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ]),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 150,
                  child: Image.asset("assets/logo.png"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextWidget(
                  text: "Login",
                  color: Colors.lightBlue,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(text: "No account yet? ", color: Colors.grey[600]),
                  GestureDetector(
                      onTap: () {
                        print("Enregistrement");
                      },
                      child: const TextWidget(
                          text: "Register", color: Colors.lightBlue)),
                ],
              ),
              const SizedBox(height: 30),
              textField(
                "Email or phone number",
                emailOrNumber,
                const SizedBox(),
                false,
              ),
              const SizedBox(height: 30),
              textField(
                "Password",
                password,
                GestureDetector(
                  onTap: () => setState(() => obscureText = !obscureText),
                  child: Icon(
                    !obscureText
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                    color: Colors.lightBlue,
                  ),
                ),
                obscureText,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => remeberMe = !remeberMe),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: remeberMe ? Colors.blueAccent : null,
                          border: Border.all(
                            color: !remeberMe ? Colors.grey : Colors.blueAccent,
                          ),
                        ),
                        child: remeberMe
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    TextWidget(
                        text: 'Keep me signed in', color: Colors.grey[600]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 20, bottom: 20),
                child: MyButton(
                  text: 'Sign in',
                  onTap: () {
                    print(' ========> sign in');
                  },
                  color: Colors.orange,
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 1,
                      color: Colors.grey[600], // Couleur de la ligne
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: TextWidget(text: "Or", color: Colors.grey[600])),
                    Container(
                      width: 100,
                      height: 1,
                      color: Colors.grey[600], // Couleur de la ligne
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 20, bottom: 20),
                child: MyButton(
                  text: 'G login in with Google',
                  onTap: () {
                    print(' ========> G login in with Google');
                  },
                  color: Colors.blueAccent,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print(' ========> Password forgotten ?');
                },
                child: const TextWidget(text: "Password forgotten ?"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
