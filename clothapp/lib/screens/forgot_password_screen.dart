import 'package:flutter/material.dart';

import 'package:clothapp/screens/login_screen.dart';
import 'package:clothapp/widgets/custome_textField.dart';
import 'package:clothapp/widgets/gradeint_button.dart';

import '../theme/theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _recoveryStarted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot Password?",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Enter your email address to recover/reset your password",
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 48,
              ),
              if (!_recoveryStarted)
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: "Email Address",
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email address";
                          }
                          if (!value.contains('@')) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      GradientButton(
                          text: "Reset Password",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _recoveryStarted = true;
                              });
                              //handle the email recovery logic
                            }
                          }),

                      SizedBox(height: 28,),

                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginScreen())),
                          child: Text(
                            "Back to Login",
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppTheme.success.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.check_circle_outline,size: 40,color: AppTheme.success,),
                      ),
                      SizedBox(height: 24,),
                      Text("Reset Email Sent",style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 16,),
                      Text("We have sent a password reset link to your email address. Please check your inbox and follow the instruction.",style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 16,
                        height: 1.5,
                      ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32,),
                      GradientButton(text: "Open Email App", onPressed: (){
                        //optional if you want to open your email app from here
                      }),

                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Back to Login",
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
