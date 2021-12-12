import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(
            image: AssetImage(
              "assets/images/authentication.png",
            ),
            fit: BoxFit.cover,
          ),
          const Text(
            "Welcome",
            style: TextStyle(
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
                  decoration: const InputDecoration(
                    // hinText shows greyed text for hint
                    hintText: "Username",
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                    // obsecureText field is for type : Password(****)
                    // which is false by defualt
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
          ElevatedButton(
            onPressed: () {
              print("Log In pressed");
            },
            child: const Text("Log In"),
          ),
        ],
      ),
    );
  }
}
