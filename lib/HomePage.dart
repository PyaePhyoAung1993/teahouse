import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teahouse/loginPage.dart';
import 'package:teahouse/screens/myorderDetailPage.dart';
import 'package:teahouse/screens/orderpageScreen.dart';
import 'package:teahouse/style/dateFormat.dart';
import 'package:teahouse/style/textStyle.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  Map<String, dynamic> userData;

  String token;

  HomePage({Key key, this.userData}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();

  var api = 'http://theburmeseteahouse.kwintechnologies.com/api/Login';
  var res, datas;

  @override
  void initState() {
    super.initState();
    fetchData("burmateahouse2@gmail.com", "teahouse123@");
  }

  fetchData(String emailController, String passwordController) async {
    res = await http.post(api, body: {
      'email': emailController,
      'password': passwordController,
    });
    print("Res : $res ");

    datas = jsonDecode(res.body);
    Map<String, dynamic> userData = datas['user'];
    widget.token = datas['access_token'];

    print('Response data : $datas');
    print('String Response  ${datas.toString()}');
    print("Access Token   :" + datas['access_token']);

    print(userData);

    setState(() {});
  }

  Future<bool> _willPop() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (c) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "TODAY :  ",
                          style: textEditStyle,
                        ),
                      ),
                      Text(
                        appDateForm(date).toString(),
                        style: textEditStyle,
                      ),
                    ],
                  ),
                  Text(
                    "The Burma Tea House",
                    style: textEditStyle1,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) => MyorderDetailPage()),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Colors.grey[100]),
                      ),
                      margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Container(
                                width: 70,
                                height: 50,
                                child: Image(
                                  color: Colors.green,
                                  image: AssetImage("assets/images/b.png"),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "My Order",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderpageScreen(
                            token: widget.token,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: BorderSide(color: Colors.grey[100]),
                      ),
                      margin: EdgeInsets.only(
                        top: 150,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Container(
                                width: 70,
                                height: 50,
                                child: Image(
                                  color: Colors.green,
                                  image: AssetImage("assets/images/a.png"),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Order Page",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
