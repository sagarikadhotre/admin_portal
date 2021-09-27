import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/user.dart';
import 'package:flutter_application_1/signup.dart';


import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String email;
  String pswd;
  String username, password;
  String errormsg;
  bool error = false;

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ScaffoldMessengerState scaffoldMessenger;

  Future save() async {
    var res = await http.post(Uri.parse("http://localhost:8080/signin"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.email,
          'password': user.password
        });
    print(res.body);
    if (res.statusCode == 200) {
      // Navigator.push(
      //     context, new MaterialPageRoute(builder: (context) => Home()));
    } else {
      scaffoldMessenger
          .showSnackBar(SnackBar(content: Text("This is not valid user")));
    }
  }

  User user = User('', '');

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome,",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Sign in to continue!",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                  ),
                ],
              ),
              Column(
                children: <Widget>[

                  TextFormField(

                    keyboardType: TextInputType.emailAddress,

                    onChanged: (value) {
                      email = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty)  return 'email required.';

                      String pattern = r'\w+@\w+\.\w+';
                      RegExp regex = RegExp(pattern);
                      if(!regex.hasMatch(value)) return 'invalid email format.';

                    },

                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email ID",
                      labelStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(

                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      pswd = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'password required';
                      }
                      return null;
                    },

                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password ?",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                        if (_emailController.text.isEmpty &&
                            _passwordController.text.isEmpty) {
                          scaffoldMessenger.showSnackBar(SnackBar(
                              content: Text("Please Fill all fileds")));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        }
                      },
                      padding: EdgeInsets.all(0),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xffff5f6d),
                              Color(0xffff5f6d),
                              Color(0xffffc371),
                            ],
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                              maxWidth: double.infinity, minHeight: 50),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Container(
                  //   height: 50,
                  //   width: double.infinity,
                  //   child: FlatButton(
                  //     onPressed: () {},
                  //     color: Colors.indigo.shade50,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: <Widget>[
                  //         Image.asset(
                  //           "images/facebook.png",
                  //           height: 18,
                  //           width: 18,
                  //         ),
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         Text(
                  //           "Connect with Facebook",
                  //           style: TextStyle(
                  //               color: Colors.indigo,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "I'm a new user.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => SignUp()));
                      },
                      child: Text(
                        "Sign up",

                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    )
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
