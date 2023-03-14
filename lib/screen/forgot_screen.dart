import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _emailController = TextEditingController();

  Future resetPassword() async {
    try{
       await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim()).then((value) => showDialog(
        context: context, 
        builder: (context) {
          return const AlertDialog(
            content: Text('Password link send! Check your email '),
          );
        }
        ));   
    } on FirebaseException catch(e) {
      return showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        }
        );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const Text(
            'Enter Your Email we will send you reset link',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
            ),
              const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    color: Colors.grey[200],
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          helperText: 'Email',
                          fillColor: Colors.grey,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  color: Colors.deepPurple,
                  onPressed: () {
                   
                  },
                  child: const Text('Reset Password'),
                  )
        ],
      ),
      );
  }
}