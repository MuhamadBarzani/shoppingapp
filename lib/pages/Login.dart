import 'package:flutter/material.dart';
import 'package:shoppingapp/pages/SignUpPage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Makes the content scrollable to avoid overlap
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: Colors.yellow[700],
          child: Column(
            children: <Widget>[
              // Title Text
              const Padding(
                padding: EdgeInsets.only(top: 50, right: 200),
                child: Text(
                  "Hello,\nLOG IN!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              // White Box with Text Fields
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 60),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 50),
                        // Gmail TextField
                        const TextField(
                          decoration: InputDecoration(
                            labelText: "Gmail",
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Password TextField
                        TextField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: _togglePasswordView,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Forgot password text
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // LOG IN button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow[700],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          height: 60, // Reduced height for better spacing
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "LOG IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Don't have account text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the sign-up page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUpPage()),
                                );
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height: 20), // Extra space to prevent overlap
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
