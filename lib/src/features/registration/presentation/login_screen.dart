import 'package:app_commerce/src/data/database_repository.dart';
import 'package:app_commerce/src/features/registration/presentation/sign_up.dart';
import 'package:app_commerce/src/features/shop/presentation/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final DatabaseRepository repo;

  LoginScreen({
    required this.repo,
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _pwController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(69, 29, 38, 40),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                // logo
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
                const SizedBox(height: 50),

                //provisionTec
                Text(
                  'ProvisionTec Shop',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 42,
                    color: const Color.fromARGB(208, 210, 176, 76),
                  ),
                ),
                const SizedBox(height: 25),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //email textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: _emailController,
                          style: const TextStyle(color: Colors.white54),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white24),
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: validateEmail,
                        ),
                      ),

                      const SizedBox(height: 20),

                      //pw textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: _pwController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white54),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white24),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: validatePassword,
                        ),
                      ),
                      const SizedBox(height: 10),

                      //forget pw
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forget Password',
                              style: TextStyle(color: Colors.white54),
                            ),
                          ],
                        ),
                      ),

                      //sign in button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Perform login action
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            // Navigiere zur ShopPage

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShopPage(
                                        repo: widget.repo,
                                      )),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 176, 146, 56),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 138,
                            vertical: 15,
                          ),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),

                // or continue with
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white54,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.white54),
                      ),
                    ],
                  ),
                ),

                // google + facebook
                const SizedBox(height: 2),
                //Google , Facebook
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google
                      Image.asset(
                        'assets/images/icons_google.png',
                        height: 72,
                      ),
                      // Facebook
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/logos_facebook.png',
                        height: 72,
                      ),
                    ],
                  ),
                ),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.white54),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SignupScreen(repo: widget.repo),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? input) {
  if (input == null || input.isEmpty) {
    return 'Bitte eine Email eingeben';
  }
  // Check if the email format is valid
  const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  if (!RegExp(emailRegex).hasMatch(input)) {
    return 'gültige Email-Adresse eingeben';
  }
  return null;
}

String? validatePassword(String? input) {
  if (input == null || input.isEmpty) {
    return 'Passwort eingeben';
  }
  if (input.length < 8) {
    return 'Das Passwort muss mindestens 8 Zeichen lang sein';
  }
  return null;
}
