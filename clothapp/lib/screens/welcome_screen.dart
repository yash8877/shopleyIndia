import 'package:clothapp/screens/signup_screen.dart';
import 'package:clothapp/widgets/gradeint_button.dart';
import 'package:clothapp/theme/theme.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/images/welcome_bg.jpg'),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 32,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "ShopleyIndia",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Discover\nYour Style",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "The best way to shop your favorite brands and discover new ones",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                GradientButton(
                    text: "Get Started",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    }),

                SizedBox(height: 20,),
                
                Row(
                  children: [
                    Expanded(child: Divider(),),
                    Text("I already have an account",
                    style:TextStyle(
                        color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                                  ),
                    ),
                    Expanded(child: Divider(),),
                  ],
                ),
                SizedBox(height: 10,),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text('Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),)
                  ),
                ),

                SizedBox(height: 48,)
              ],
            ),
          )),
        ],
      ),
    );
  }
}
