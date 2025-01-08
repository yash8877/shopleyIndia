import 'package:clothapp/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widgets/custome_textField.dart';
import '../widgets/gradeint_button.dart';
import '../widgets/social_loginButtons.dart';
import 'forgot_email_screen.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                                  'Create Account',
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
                  top: MediaQuery.of(context).size.height * 0.15,
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
                            "Create your account",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Sign up to start your shopping",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          CustomTextField(
                            label: "Full Name",
                            prefixIcon: Icons.person_2_outlined,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16,),
                          CustomTextField(
                            label: "Email",
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
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

                          SizedBox(height: 16,),

                          CustomTextField(
                            label: "Confirm Password",
                            prefixIcon: Icons.lock_outline,
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          GradientButton(
                            text: "Create Account",
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
                                Text("Already have an account?",
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                  ),
                                ),

                                TextButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                  child: Text("Login"),
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