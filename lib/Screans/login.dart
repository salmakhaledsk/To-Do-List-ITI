import 'package:day3/Screans/addtasks.dart';
import 'package:day3/Screans/register.dart';
import 'package:day3/models/customButtom.dart';
import 'package:day3/models/customTextfiled.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _passwordController = TextEditingController();
  final _usernameController =
      TextEditingController(); 
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
              SizedBox(height: 38),
              Text(
                'Login',
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
                controller: _usernameController,
                prefixIcon: Icon(Icons.person, color: Colors.white),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Password', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 8),
              CustomTextFiled(
                hittext: 'Password ',
                hitcolor: Colors.white,
                controller: _passwordController,
                isPassword: true,
                validator: _validatePassword,
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                suffixIcon: Icon(Icons.visibility_off, color: Colors.white),
              ),
              SizedBox(height: 26),
              CustomButtoms(
                text: 'Login',
                color: Colors.blue,
                textcolor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                AddTasks(username: _usernameController.text),
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
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      "Register",
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
