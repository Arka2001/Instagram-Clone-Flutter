import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/src/responsive/responsive.dart';
import 'package:instagram_clone/src/screens/signup_screen.dart';

import '../services/services.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthServices().logIn(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const ResponsiveLayout(
            mobileLayout: MobileScreenLayout(),
            webLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      showSnackBar(res, context);
    }

    setState(() {
      isLoading = false;
    });
  }

  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const SignupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(),
                flex: 1,
              ),
              // * SVG Image of the App Icon
              SvgPicture.asset(
                'assets/instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),
              // * Email Input TextField
              TextInputField(
                hintText: 'Enter your email',
                controller: _emailController,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              // * Password Input TextField
              TextInputField(
                hintText: 'Enter your Password',
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(height: 30),
              // * Login Button
              InkWell(
                onTap: loginUser,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : Container(
                        child: const Text('Log In'),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          color: blueColor,
                        ),
                      ),
              ),
              const SizedBox(height: 15),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              // * Sign Up Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('Don\'t have an account?'),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: navigateToSignup,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
