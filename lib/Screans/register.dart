import 'package:day3/Screans/addtasks.dart';
import 'package:day3/Screans/login.dart';
import 'package:day3/models/customButtom.dart';
import 'package:day3/models/customTextfiled.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController(); 

  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter an email";
    }
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Empty";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Empty";
    }
    if (value != _passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  double _sliderValue = 0;
  bool isChecked = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 24),
              Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              Row(
                children: [
                  Text('Username', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 8),
              CustomTextFiled(
                hittext: 'Full Name',
                hitcolor: Colors.white,
                controller: _usernameController, // <-- مضاف
                prefixIcon: Icon(Icons.person, color: Colors.white),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('Password', style: TextStyle(color: Colors.white)),
                ],
              ),
              CustomTextFiled(
                hittext: 'Password ',
                hitcolor: Colors.white,
                controller: _passwordController,
                isPassword: true,
                validator: _validatePassword,
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                suffixIcon: Icon(Icons.visibility_off, color: Colors.white),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Confirmed Password', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 8),
              CustomTextFiled(
                hittext: 'Confirmed Password',
                hitcolor: Colors.white,
                controller: _confirmPasswordController,
                isPassword: true,
                validator: _validateConfirmPassword,
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                suffixIcon: Icon(Icons.visibility_off, color: Colors.white),
              ),
              SizedBox(height: 16),
              CustomButtoms(
                text: 'Register',
                color: Colors.blue,
                textcolor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTasks(username: _usernameController.text),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(right: 10),
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              CustomButtoms(
                text: 'Continue With Google',
                color: Colors.white,
                textcolor: Colors.black,
                imagePath: 'assets/images/Apple.png',
              ),
              SizedBox(height: 16),
              CustomButtoms(
                text: 'Continue with Facebook',
                color: Colors.white,
                textcolor: Colors.black,
                imagePath: 'assets/images/Google.png',
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
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
