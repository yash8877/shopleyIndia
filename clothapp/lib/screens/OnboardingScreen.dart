import 'package:clothapp/screens/welcome_screen.dart';
import 'package:clothapp/widgets/gradeint_button.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  final List<OnboardingData> _pages = [
    OnboardingData(
      "Discover Latest Trends",
      "Explore our vast collection of trendy and fashionable items curvated just for you",
      "assets/images/onboarding1.png",
    ),
    OnboardingData(
      "Easy Shopping Experience",
      "Shop with ease and get your favorite items delivered right to your doorstep",
      "assets/images/onboarding2.png",
    ),
    OnboardingData(
      "Secure Payments",
      "Multiple secure payments options for safe and hassle-free transactions",
      "assets/images/onboarding3.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return OnboardingPage(data: _pages[index]);
            },
          ),
          Positioned(
            top: 48,
            right: 24,
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 24,
            right: 24,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: _currentPage == index ? 24 : 8,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(
                                _currentPage == index ? 1 : 0.3,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          )),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    if (_currentPage > 0)
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              _pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            },
                            style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                side: BorderSide(color: AppTheme.primaryColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                            child: Text("Previous",style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 16,
                            ),),),
                      ),
                    if(_currentPage > 0) const SizedBox(width: 16,),
                    Expanded(
                      child: GradientButton(
                          text: _currentPage == _pages.length - 1 ? "Get Started" : "Next",
                        gradient: [
                          AppTheme.primaryColor,
                          AppTheme.primaryColor.withOpacity(0.8),
                        ],
                        onPressed: (){
                            if(_currentPage < _pages.length - 1){
                              _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                            }
                            else{
                              Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                            }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData(this.title, this.description, this.image);
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            data.image,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SizedBox(
            height: 48,
          ),
          Text(
            data.title,
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            data.description,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
