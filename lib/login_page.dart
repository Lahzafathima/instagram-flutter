import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int buttonColor = 0xff26A9FF;

  @override
  void initState() {
    super.initState();
    // Load saved credentials when the app starts
    loadCredentials();
  }

  // Save credentials to SharedPreferences
  Future<void> saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', usernameController.text);
    prefs.setString('password', passwordController.text);
    prefs.setBool('isLoggedIn', true);
  }

  // Basic validation for email and password
  bool isValidCredentials() {
    return isValidEmail(usernameController.text) &&
        passwordController.text == 'Instagram123';
  }

  // Email validation function
  bool isValidEmail(String? email) {
    if (email == null) return false;
    // You can implement a more robust email validation logic here
    return email.contains('@');
  }

  // Load saved credentials from SharedPreferences
  Future<void> loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = prefs.getString('username') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
    });
  }

  Future<void> navigateToHomeScreen() async {
    if (isValidCredentials()) {
      saveCredentials();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Handle invalid credentials, e.g., show an error message
      print('Invalid credentials');
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviseWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: deviseWidth * 0.1),
                Image.asset(
                  'asset/insta.png',
                  height: deviseWidth * 0.20,
                ),
                SizedBox(height: deviseWidth * 0.05),
                TextField(
                  onChanged: (_) => setState(() {}),
                  controller: usernameController,
                  style: TextStyle(
                    fontSize: deviseWidth * 0.030,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Phone number, email or username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Color(0xffE8E8E8),
                  ),
                ),
                SizedBox(height: deviseWidth * 0.02),
                TextField(
                  onChanged: (_) => setState(() {}),
                  controller: passwordController,
                  obscureText: true,
                  style: TextStyle(
                    fontSize: deviseWidth * 0.030,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Color(0xffE8E8E8),
                  ),
                ),
                SizedBox(height: deviseWidth * 0.02),
                GestureDetector(
                  onLongPressStart: (s) {
                    setState(() {
                      buttonColor = 0xff78C9FF;
                    });
                  },
                  onLongPressEnd: (s) {
                    setState(() {
                      buttonColor = 0xff26A9FF;
                    });
                  },
                  onTap: navigateToHomeScreen,
                  child: Container(
                    height: deviseWidth * 0.14,
                    decoration: BoxDecoration(
                      color: Color(buttonColor),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: deviseWidth * 0.030,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: deviseWidth * 0.035),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot your login details? ',
                      style: TextStyle(
                        fontSize: deviseWidth * 0.030,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Get help');
                      },
                      child: Text(
                        'Get help',
                        style: TextStyle(
                          fontSize: deviseWidth * 0.030,
                          color: Color(0xff002588),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: deviseWidth * 0.030),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: deviseWidth * 0.30,
                      color: Color(0xffA2A2A2),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'OR',
                      style: TextStyle(
                        fontSize: deviseWidth * 0.030,
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(width: 10),
                    Container(
                      height: 1,
                      width: deviseWidth * 0.30,
                      color: Color(0xffA2A2A2),
                    ),
                  ],
                ),
                SizedBox(height: deviseWidth * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/fb.png',
                      height: deviseWidth * 0.060,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Login with Facebook',
                      style: TextStyle(
                        color: Color(0xff1877f2),
                        fontSize: deviseWidth * 0.030,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: deviseWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: deviseWidth,
                        height: 1,
                        color: Color(0xffA2A2A2),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: deviseWidth * 0.030,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('Sign up');
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Color(0xff00258B),
                                fontSize: deviseWidth * 0.030,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
