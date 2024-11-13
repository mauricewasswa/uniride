import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniride/main.dart';
import 'package:uniride/ui/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Text editing controllers to retrieve input values
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _regNumberController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> registeruser()async {
    final supabase = Supabase.instance.client;
     await supabase
         .from('users')
         .insert({
       'fname': _firstNameController.text,
       'lname':_lastNameController.text,
       'email':_emailController.text,
       'regNumber':_regNumberController.text,
       'year':int.tryParse(_yearController.text),
       'password':_passwordController.text
     });

  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _regNumberController.dispose();
    _yearController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // First Name Field
                      TextFormField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          hintText: 'Enter your first name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // Last Name Field
                      TextFormField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          hintText: 'Enter your last name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // Registration Number Field
                      TextFormField(
                        controller: _regNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Registration Number',
                          hintText: 'Enter your registration number',
                          prefixIcon: Icon(Icons.badge),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your registration number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // Year Field
                      TextFormField(
                        controller: _yearController,
                        decoration: const InputDecoration(
                          labelText: 'Year',
                          hintText: 'Enter your year of study',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your year of study';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),

                      // Register Button
                      // ElevatedButton(
                      //   onPressed: () {
                      //     if (_formKey.currentState!.validate()) {
                      //       // If all validations pass, you can proceed with registration
                      //       // For now, just display the values in the console
                      //       print("First Name: ${_firstNameController.text}");
                      //       print("Last Name: ${_lastNameController.text}");
                      //       print("Email: ${_emailController.text}");
                      //       print("Registration Number: ${_regNumberController.text}");
                      //       print("Year: ${_yearController.text}");
                      //       print("Password: ${_passwordController.text}");
                      //       // Add your registration logic here
                      //     }
                      //   },
                      //   child: const Text('Register'),
                      // ),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          onPressed: () {
                            // if (_formKey.currentState?.validate() ?? false) {
                            // Navigate to Material3BottomNav after form validation
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const SignInPage2(), // Replace with your actual widget
                            //   ),
                            // );
                            // }

                                  print("First Name: ${_firstNameController.text}");
                                  print("Last Name: ${_lastNameController.text}");
                                  print("Email: ${_emailController.text}");
                                  print("Registration Number: ${_regNumberController.text}");
                                  print("Year: ${_yearController.text}");
                                  print("Password: ${_passwordController.text}");

                                  registeruser();
                          },

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
