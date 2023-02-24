import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/models/models.dart';
import 'package:indesa_beta/router/router_generator.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:indesa_beta/widgets/widget.dart';

import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GraphQlConfig _config = GraphQlConfig();
  Map<String, dynamic> _dataUser;
  String _notValidUser;
  DatabaseHelper _dbHelper = DatabaseHelper();

  //bloc
  var bloc = LoginBloc();

  //for logo & form animation
  bool _isVisible = false;
  bool _isMove = false;
  @override
  void initState() {
    _dataUser = {};
    _notValidUser = "";
    _emailController.text = '';
    _passwordController.text = '';
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _isVisible = true;
        _isMove = true;
      });
    });
    super.initState();
  }

  //mutation login
  void _login() async {
    bloc.loginSink.add(Status.loading);
    GraphQLClient _client = _config.clientToQuery();
    try {
      var result = await _client.mutate(
          loginOptions(_emailController.text, _passwordController.text));
      var data = result.data['login'];
      _dataUser.clear();
      _dataUser.addAll(data);
      var insertData = await _dbHelper.insertUserData(User(
        data['userId'],
        data['email'],
        data['username'],
        data['namaLengkap'],
        data['nik'],
        data['nip'],
        data['noHp'],
        data['role'],
        data['namaRole'],
        data['token'],
        data['expired'],
      ));
      if (insertData != 0) {
        print('data inserted');
        showToast("login berhasil", context);
        Navigator.pushReplacementNamed(context, RouterGenerator.routeDashboard);
      } else {
        print('insert data failed');
      }
    } catch (error) {
      _notValidUser = "email atau password salah!";
      bloc.loginSink.add(Status.initial);
      debugPrint('$error');
    }
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // for form validation
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _validate() {
    if (_formKey.currentState.validate()) {
      print("validate");
      _login();
    } else {
      print("not validate");
    }
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
    var topBefore = (deviceHeight() * 0.5) - 115;
    var left = (deviceWidth() * 0.5) - 90;
    var topAfter = (deviceHeight() * 0.3) - 90;

    return Scaffold(
        body: StreamBuilder(
      initialData: Status.initial,
      stream: bloc.loginStream,
      builder: (BuildContext context, AsyncSnapshot<Status> snapshot) {
        var status = snapshot.data;
        if (status == Status.initial || status == Status.loading) {
          return SizedBox.expand(
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
                      padding: EdgeInsets.only(top: deviceHeight() * 0.48),
                      child: AnimatedOpacity(
                        opacity: _isVisible ? 1 : 0,
                        duration: Duration(milliseconds: 1000),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            children: [
                              Text(
                                _notValidUser,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: setFontSize(40)),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    right: deviceWidth() * 0.18,
                                    left: deviceWidth() * 0.10),
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      labelText: "Email",
                                      icon: const Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: const Icon(Icons.person))),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "tidak boleh kosong"),
                                    EmailValidator(
                                        errorText: "email tidak valid")
                                  ]),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: deviceWidth() * 0.10,
                                    right: deviceWidth() * 0.18,
                                    top: 10,
                                    bottom: 20),
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(_obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        color: Colors.black54,
                                        iconSize: 17.5,
                                        onPressed: () {
                                          _togglePassword();
                                        },
                                      ),
                                      labelText: "Password",
                                      icon: const Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: const Icon(Icons.lock))),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "tidak boleh kosong"),
                                    MinLengthValidator(8,
                                        errorText:
                                            "password minimal 8 karakter")
                                  ]),
                                ),
                              ),
                              status == Status.loading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : RoundedButton(
                                      onPress: () {
                                        _validate();
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
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
