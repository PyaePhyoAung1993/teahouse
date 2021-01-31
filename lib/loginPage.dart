import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:teahouse/HomePage.dart';
import 'package:teahouse/registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  var api = 'http://theburmeseteahouse.kwintechnologies.com/api/Login';
  var res, datas;

  @override
  void initState() {
    super.initState();
  }

  fetchData(String emailController, String passwordController) async {
    res = await http.post(api, body: {
      'email': emailController,
      'password': passwordController,
    });
    print("Res : $res ");

    datas = jsonDecode(res.body);
    Map<String, dynamic> userData = datas['user'];

    print('Response data : $datas');
    print('String Response  ${datas.toString()}');
    print("Access Token   :" + datas['access_token']);
    print(userData);

    setState(() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (c) => HomePage(
                userData: userData,
              )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image(
              color: Colors.green,
              image: AssetImage("assets/images/a.png"),
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 40, right: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
              side: BorderSide(color: Colors.grey[100]),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey[300],
                  width: 0.0,
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: emailController,
                      // cursorColor: Colors.green,
                      maxLength: 20,
                      initialValue: null,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.green),
                        // ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: passwordController,
                      // cursorColor: Theme.of(context).cursorColor,
                      // obscureText: true,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.green),
                        // ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.green)),
                        color: Colors.white,
                        onPressed: () {
                          fetchData(
                              emailController.text, passwordController.text);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.green)),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => RegisterPage()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
