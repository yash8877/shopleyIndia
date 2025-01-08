import 'package:clothapp/screens/signup_screen.dart';
import 'package:clothapp/theme/theme.dart';
import 'package:clothapp/widgets/custome_textField.dart';
import 'package:clothapp/widgets/gradeint_button.dart';
import 'package:clothapp/widgets/social_loginButtons.dart';
import 'package:flutter/material.dart';

import 'forgot_email_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: AppTheme.primaryGradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -50,
                        right: -50,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 48,
                        left: 16,
                        right: 16,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Welcome Back',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.20,
                  left: 24,
                  right: 24,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Login to your account",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Enter your credentials to continue shopping",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          CustomTextField(
                            label: "Email",
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16,),

                          CustomTextField(
                            label: "Password",
                            prefixIcon: Icons.lock_outline,
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordScreen()));
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: AppTheme.primaryColor,
                              ),
                              child: Text("Forgot Password"),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          GradientButton(
                            text: "Login",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Center(
                            child: Text(
                              "Or continue with",
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          SizedBox(height: 24,),

                          Row(
                            children: [
                              Expanded(
                                child: SocialLoginbuttons(
                                  text: "Google",
                                  iconPath: "assets/icons/google.png",
                                  onPressed: () {},
                                ),
                              ),

                              SizedBox(width: 16,),

                              Expanded(
                                child: SocialLoginbuttons(
                                  text: "Apple",
                                  iconPath: "assets/icons/apple.png",
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          
                          Center(
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?",
                                style: TextStyle(
                                  color: AppTheme.textSecondary,
                                ),
                                ),

                                TextButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                                    },
                                    child: Text("Sign Up"),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
