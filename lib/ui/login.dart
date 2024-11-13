import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'navbar.dart';

class SignInPage2 extends StatefulWidget {
  const SignInPage2({super.key});

  @override
  State<SignInPage2> createState() => _SignInPage2State();
}

class _SignInPage2State extends State<SignInPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Text editing controllers to retrieve input values
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future<void> loginuser(BuildContext context) async {
    final supabase = Supabase.instance.client;

    try {
      // Select email and password from users table based on the provided email
      final response = await supabase
          .from('users')
          .select('email, password')
          .eq('email', _emailController.text)
          .single(); // Use .single() if you expect only one row of result

      if (response != null && response.isNotEmpty) {
        final retrievedEmail = response['email'];
        final retrievedPassword = response['password'];

        // Check if the entered password matches the retrieved one
        if (retrievedPassword == _passwordController.text) {
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login successful!"),
              backgroundColor: Colors.green,
            ),
          );

          // Navigate to the home screen (replace with your actual Home screen widget)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Material3BottomNav()), // Replace HomeScreen with your actual home screen widget
          );
        } else {
          // Invalid password
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Invalid password"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // User not found
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User not found"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Catch any errors (e.g., network issues, authentication errors, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          backgroundColor: Colors.red,
        ),
      );
      print("Error during login: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email Input
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your Email',
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Password Input
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your Password',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Login Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              loginuser(context); // Call the login function if the form is valid
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ],
                    ),
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
