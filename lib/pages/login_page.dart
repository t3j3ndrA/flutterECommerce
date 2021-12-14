import 'package:ecom/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = "";

  // handle's circular animation of the Login Button
  // sets to true when pressed login
  // if value is true, change the button to Done & Circuler
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Image(
                image: AssetImage(
                  "assets/images/authentication.png",
                ),
                fit: BoxFit.cover,
              ),
              Text(
                "Welcome $userName",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) => validateUsername(value),
                      decoration: const InputDecoration(
                        // hinText shows greyed text for hint
                        hintText: "Username",
                      ),
                      onChanged: (value) {
                        setState(() {
                          userName = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                        // obsecureText field is for type password - '******'
                        // which is false by defualt
                        validator: (value) => validatePassword(value),
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),

              // Creating button using AnimatedContainer for animation
              // wrap the AnimatedContainer with InkWell
              // to get the button's functionlities like : onTap(), onChange(),..etc.
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      changeButton = true;
                    });

                    // wait for 1 sec to let the animation complete
                    await Future.delayed(Duration(seconds: 1));

                    // to Home Screen
                    await Navigator.pushNamed(context, MyRoutes.homeRoute);

                    // revert back the animation to the normal LOGIN button
                    // as user came back to the form page
                    setState(() {
                      changeButton = false;
                    });
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: changeButton ? 50 : 150,
                  height: 50,
                  alignment: Alignment.center,
                  child: changeButton
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 28,
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                  ),
                ),
              )

              // This is replaced by AnimatedContainer under Inkwell Widget Above
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRoutes.homeRoute);
              //   },
              //   child: const Text("Log In"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// Username validator

String? validateUsername(String? value) {
  if (value == "" || value == null) {
    return "Username cannot be empty!";
  } else
    return null;
}

// Password Validator

String? validatePassword(String? value) {
  if (value == "") return "Password cannot be empty";
  if (value!.length < 6) return "Password lenght should be atleas 6";
  return null;
}
