import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterScreen({super.key, required this.showLoginPage});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> singUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(children: [
        const Icon(
          Icons.android,
          size: 50,
        ),
        const SizedBox(height: 20),
        Text('Hello There',
            style: GoogleFonts.bebasNeue(
              fontSize: 36,
            )),
        const SizedBox(height: 10),
        const Text('Register below with your details!'),
        const SizedBox(height: 30),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            color: Colors.grey[200],
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _firstNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  helperText: 'First Name',
                  fillColor: Colors.grey,
                  filled: true,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            color: Colors.grey[200],
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _lastNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  helperText: 'Last Name',
                  fillColor: Colors.grey,
                  filled: true,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            color: Colors.grey[200],
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _ageController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  helperText: 'Age',
                  fillColor: Colors.grey,
                  filled: true,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            color: Colors.grey[200],
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  helperText: 'Email',
                  fillColor: Colors.grey,
                  filled: true,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            color: Colors.grey[200],
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _passwordController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  helperText: 'Password',
                  fillColor: Colors.grey,
                  filled: true,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            color: Colors.grey[200],
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _confirmPasswordController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  helperText: 'Confirm Password',
                  fillColor: Colors.grey,
                  filled: true,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: GestureDetector(
            onTap: singUp,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
            ),
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'I am a member?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: widget.showLoginPage,
              child: const Text(
                'LogIn Now',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ])),
    ));
  }
}
