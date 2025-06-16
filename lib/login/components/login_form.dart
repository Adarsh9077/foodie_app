import 'package:flutter/material.dart';
import 'package:foodie/components/already_have_an_account_acheck.dart';
import 'package:foodie/home_page/home_page.dart';
import 'package:foodie/signup/signup_screen.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _signInWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        // PrioritizedIntents
        print("No User Found for that email");
      } else if (e.code == "wrong-password") {
        print("Wrong password provider for that user.");
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }

    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {
              print(" press onSubmit Btn");
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Email ID',
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              obscureText: true,
              obscuringCharacter: "*",
              cursorColor: kPrimaryColor,
              textInputAction: TextInputAction.done,
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your Password";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Your Password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
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
                tag: "login_btn",
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signInWithEmailAndPassword();
                    }
                  },
                  child: Text(
                    "Login".toUpperCase(),
                    style: mTextStyle20(
                      txtColor: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
          SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
} // 43:40 part 6
