// ignore_for_file: use_build_context_synchronously

import 'package:final_e_commerce/constants.dart';
import 'package:final_e_commerce/provider/modelHud.dart';
import 'package:final_e_commerce/screens/user/home_page.dart';
import 'package:final_e_commerce/screens/login_screen.dart';
import 'package:final_e_commerce/services/auth.dart';
import 'package:final_e_commerce/widgets/custom_logo.dart';
import 'package:final_e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/services.dart';
//import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  static const String id = 'signup_screen';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = Auth();
  // ignore: unused_field
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<Modelhud>(context).isloading,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const CustomLogo(),
              SizedBox(
                height: height * .1,
              ),
              const CustomTextField(
                  onClick: null,
                  hint: 'Enter Your Name',
                  icon: Icons.perm_identity,
                  errorText: 'Enter Your Name'),
              SizedBox(
                height: height * .02,
              ),
              CustomTextField(
                  onClick: (value) {
                    _email = value!;
                  },
                  hint: 'Enter Your Email',
                  icon: Icons.email,
                  errorText: 'Enter Your Email'),
              SizedBox(
                height: height * .02,
              ),
              CustomTextField(
                  onClick: (value) {
                    _password = value!;
                  },
                  hint: 'Enter Your Password',
                  icon: Icons.lock,
                  errorText: 'Enter Your Password'),
              SizedBox(
                height: height * .05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Builder(
                  builder: (context) => TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    onPressed: () async {
                      final modelhud =
                          Provider.of<Modelhud>(context, listen: false);
                      modelhud.changeisLoading(true);
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        try {
                          // ignore: unused_local_variable
                          final result = await _auth.signup(_email, _password);
                          modelhud.changeisLoading(false);
                          Navigator.pushNamed(context, HomePage.id);
                        } catch (e) {
                          modelhud.changeisLoading(false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                            ),
                          );
                        }
                      }
                      modelhud.changeisLoading(false);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Do have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 16, color: Colors.black),
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
