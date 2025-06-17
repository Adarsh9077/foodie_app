import 'package:flutter/material.dart';
import 'package:foodie/components/already_have_an_account_acheck.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie/home_page/home_page.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _signUpWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The Password is too weak");
      } else if (e.code == "email-already-in-use") {
        print("The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: defaultPadding),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter Email Address";
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person_rounded),
              ),
              hintText: "Email ID",
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              obscuringCharacter: "*",
              cursorColor: kPrimaryColor,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter Password";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Your Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_outlined),
                ),
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          _isLoading
              ? CircularProgressIndicator()
              : Hero(
                tag: "signup_btn",
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signUpWithEmailAndPassword();
                    }
                  },
                  child: Text(
                    "Sign Up".toUpperCase(),
                    style: mTextStyle20(
                      txtColor: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
          SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.pop(context);
            },
          ),
          // SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}