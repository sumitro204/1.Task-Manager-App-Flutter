import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utils/assets_paths.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80,),
                  Text('Join With Us',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 24,),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),

                    validator: (String ? value){
                      String email = value ?? '';
                      if(EmailValidator.validate(email) == false){
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _firstNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                    ),

                   validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Enter your first name";
                      }
                      return null;
                   },
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _lastNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),

                   validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Enter your last name";
                      }
                      return null;
                   },
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _phoneTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Mobile',
                    ),

                    validator: (String ? value){
                      if((value?.length ?? 0) <= 11){
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),

                    validator: (String ? value){
                      if((value?.length ?? 0) <= 6){
                        return 'Enter a valid Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(
                    onPressed: _onTapSignUpButton,
                    child: Icon(Icons.arrow_forward,color: Colors.white, ),
                  ),
                  const SizedBox(height: 32,),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: "Have account? ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: 0.5
                          ),
                          children: [
                            TextSpan(
                                text: 'Sign in',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700
                                ),
                                recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton
                            )
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

  void _onTapSignUpButton(){
    if(_formKey.currentState!.validate()){
      // TODO: Sign in with API
    }
  }
  void _onTapSignInButton(){
    Navigator.popAndPushNamed(context, SignInScreen.name);
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

}
