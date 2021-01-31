import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  var api = 'https://bobahtoo-housing.com/api/authentication';
  var res, datas;

  @override
  void initState() {
    super.initState();
  }

  // fetchData(String userCodeController, String passwordController) async {
  //   res = await http.post(api, headers: {
  //     "Accept": 'application/json',
  //   }, body: {
  //     'user_code': userCodeController,
  //     'password': passwordController
  //   });
  //   if (res != null) {
  //     datas = jsonDecode(res.body);
  //   }

  //   print('Response data : $datas');
  //   print('String Response  ${datas.toString()}');
  //   print("Access Token   :" + datas['access_token']);
  //   setState(() {
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (c) => RulePage(
  //               token: datas['access_token'],
  //             )));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image(
              color: Colors.green,
              image: AssetImage("assets/images/a.png"),
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 10, left: 40, right: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
              side: BorderSide(color: Colors.grey[100]),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: nameController,
                      // cursorColor: Colors.green,
                      keyboardType: TextInputType.name,
                      maxLength: 20,
                      initialValue: null,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.green),
                        // ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: emailController,
                      // cursorColor: Colors.green,
                      keyboardType: TextInputType.emailAddress,
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
                      controller: addressController,
                      // cursorColor: Colors.green,
                      keyboardType: TextInputType.name,
                      maxLength: 20,
                      initialValue: null,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.green),
                        // ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: phoneController,
                      // cursorColor: Colors.green,
                      keyboardType: TextInputType.phone,
                      maxLength: 20,
                      initialValue: null,
                      decoration: InputDecoration(
                        labelText: 'Phone',

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
                      keyboardType: TextInputType.visiblePassword,
                      // cursorColor: Theme.of(context).cursorColor,
                      obscureText: true,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.green),
                        // ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: confirmpasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      // cursorColor: Theme.of(context).cursorColor,
                      obscureText: true,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
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
                          Navigator.pushNamed(context, '/');
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
                          // fetchData(
                          //     userCodeController.text, passwordController.text);
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
          ),
        ],
      ),
    );
  }
}
