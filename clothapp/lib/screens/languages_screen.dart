import 'package:flutter/material.dart';

import '../theme/theme.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  String? _selectLanguage;

  final List<Map<String, String>> _languages = [
    {
      'code' : 'en',
      'name' : 'English',
      'nativeName' : 'English',
    },
    {
      'code' : 'es',
      'name' : 'Spanish',
      'nativeName' : 'Espanol',
    },
    {
      'code' : 'fr',
      'name' : 'French',
      'nativeName' : 'Francais',
    },
    {
      'code' : 'de',
      'name' : 'German',
      'nativeName' : 'Deutsch',
    },
    {
      'code' : 'it',
      'name' : 'Italian',
      'nativeName' : 'Italiano',
    },
  ];
  void _handleLanguageSelection(){
    if(_selectLanguage != null){
      //implemented language change logic here
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.arrow_back,color: AppTheme.textPrimary,),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child:SingleChildScrollView(
                child: Padding(padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Choose Language",
                    style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(height: 8,),
                    Text("Select your preferred language",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    ),
                    SizedBox(height: 32,),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        final language = _languages[index];
                        final isSelected = language['code'] == _selectLanguage;
                        
                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary.withOpacity(0.2),
                              width: isSelected ? 2 : 1,
                            )
                          ),
                        );
                      },
                    ),
                  ],
                ),
                ),
              )
          )
        ],
      ),
    );
  }
}
