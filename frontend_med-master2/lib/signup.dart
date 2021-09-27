import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/user.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  String username, password;
  String errormsg;
  bool error = false;
  String name;
  String email;
  String pswd;
  String conpswd;
  String _isValid;
  String pattern;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ScaffoldMessengerState scaffoldMessenger;

  postsignup(name,email,pswd,conpswd) async {
    //final file = await _formkey;
    String info;
    var url = Uri.parse('http://106.213.102.92:27017/signup');

    var response =
    await http.post(url, body:
    {
      "name":name,
      "email":email,
      "pswd":pswd ,
      "conpswd": conpswd,
    });

    var respStr = "";

    info = json.decode(response.body);
    if (response.statusCode == 201) {

      respStr = response.body;

    } else {
      info = "Error in response";
    }
    return jsonDecode(respStr);
  }

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome,",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Sign Up if you are a new user!",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            name = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'name required';
                            }
                            return null;

                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade400),
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

                            decoration: InputDecoration(
                              labelText: "Email ID",
                              labelStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade400),
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
                            )),
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
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade400),
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
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            conpswd = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'confirm password required to be filled';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade400),
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
                          height: 60,
                        ),
                        GestureDetector(
                          onTap: () {

                            if (_formKey.currentState.validate()) {
                              if (pswd == conpswd) {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                                setState(() {
                                  // if (_formKey.currentState.validate()) {
                                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                                  // }
                                  postsignup(name,email,pswd,conpswd);
                                  print(name);
                                  print(email);
                                  print(pswd);
                                  print(conpswd);


                                });

                              }
                              else {
                                scaffoldMessenger.showSnackBar(SnackBar(
                                    content: Text(
                                        "Oops! Confirm password is not matching password")));
                              }}
                            else
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Complete the form")));
                          },

                          child: Container(
                            height: 45,
                            child: Material(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.blue[800],
                              elevation: 7,
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
