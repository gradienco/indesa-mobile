import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/widgets/widget.dart';

import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isBusyView = false;

  //bloc
  var bloc = LoginBloc();

  //for logo & form animation
  bool _isVisible = false;
  bool _isMove = false;
  @override
  void initState() {
    _usernameController.text = 'username';
    _passwordController.text = 'password';
    Timer(Duration(milliseconds: 1000),(){
      setState(() {
        _isVisible = true;
        _isMove = true;
      });
    });
    super.initState();
  }

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // for form validation
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _validate(){
    var username = _usernameController.text;
    var password = _passwordController.text;
    Map<String, dynamic> map = {
      'username': username,
      'password' : password,
      'context' : context
    };
    if(_formKey.currentState.validate()) {
      bloc.loginSink.add(map);
      print("validate");
    } else {
      print("not validate");
    }
  }

  void _goToDashboard() {
  //  Navigator.push(context, FadeRoute(page: Dashboard()));
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Splash()));
  }

  //for hide & show password
  bool _obscureText = true;
  // Toggles the password show status
  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {

    setupScreenUtil(context);
    var topBefore = (deviceHeight()*0.5) - 115;
    var left = (deviceWidth()*0.5) - 90;
    var topAfter = (deviceHeight()*0.3) - 90;

    return Scaffold(
      body: (!_isBusyView) ? SizedBox.expand(
        child: ListView(
          children: [
            Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 700),
                  top: _isMove ? topAfter : topBefore,
                  left: left,
                  child: Image(
                    width: 180,
                    height: 180,
                    image: AssetImage("$imageAsset/logo_indesa.png"),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: deviceHeight()*0.5),
                  child: AnimatedOpacity(
                    opacity: _isVisible ? 1 : 0,
                    duration: Duration(milliseconds: 1000),
                    child: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: deviceWidth() * 0.18, left: deviceWidth() * 0.10),
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: "Username",
                                icon: const Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: const Icon(Icons.person))
                              ),
                              validator: MultiValidator([
                                RequiredValidator(errorText: "tidak boleh kosong"),
                                MinLengthValidator(6, errorText: "username minimal 6 karakter")
                              ]),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: deviceWidth() * 0.10, right: deviceWidth() * 0.18, top: 10, bottom: 20),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                                  color: Colors.black54,
                                  iconSize: 17.5,
                                  onPressed: (){
                                    _togglePassword();
                                  },
                                ),
                                labelText: "Password",
                                icon: const Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: const Icon(Icons.lock))
                              ),
                              validator: MultiValidator([
                                RequiredValidator(errorText: "tidak boleh kosong"),
                                MinLengthValidator(8, errorText: "password minimal 8 karakter")
                              ]),
                            ),
                          ),

                          RoundedButton(
                            onPress: (){
                              _validate();
                              setState(() {
                                _isBusyView = true;
                              });
                            },
                            topMargin: 10,
                            horizontalMargin: 10,
                          )

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )
      : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}