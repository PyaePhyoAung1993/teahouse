import 'package:flutter/material.dart';
import 'package:teahouse/HomePage.dart';
import 'package:teahouse/screens/orderpageScreen.dart';
import 'package:teahouse/style/textStyle.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyorderDetailPage1 extends StatefulWidget {
  @override
  _MyorderDetailPageState createState() => _MyorderDetailPageState();
}

class _MyorderDetailPageState extends State<MyorderDetailPage1> {
  var res, datas;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _show() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Row(
                children: [
                  Image(
                    color: Colors.green,
                    image: AssetImage(
                      "assets/images/a.png",
                    ),
                  ),
                  Text(
                    "Alert",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              content: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 7,
                child: Text(
                  'Are You Sure To Check Bill',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                FlatButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    _show1();
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }

  Future<bool> _show1() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Row(
                children: [
                  Image(
                    color: Colors.green,
                    image: AssetImage(
                      "assets/images/a.png",
                    ),
                  ),
                  Text(
                    "Check Bill Successful",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              content: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Voucher No:',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  )),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    showToast();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (c) => HomePage()));
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }

  Future<bool> _willPop() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (c) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("My Order Detail Page"),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    "Home",
                    style: textEditStyle.copyWith(color: Colors.green),
                  ),
                ),
              ],
              onSelected: (int menu) {
                if (menu == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => HomePage()));
                } else {}
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Quantity",
                    style: textEditStyle3,
                  ),
                  Text(
                    ":0",
                    style: textEditStyle3,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: textEditStyle3,
                  ),
                  Text(
                    ":0",
                    style: textEditStyle3,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total No",
                    style: textEditStyle3,
                  ),
                  Text(
                    ":0",
                    style: textEditStyle3,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Number",
                    style: textEditStyle3,
                  ),
                  Text(
                    ":0",
                    style: textEditStyle3,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                    style: textEditStyle3,
                  ),
                  Text(
                    ":0",
                    style: textEditStyle3,
                  ),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.only(top: 200),
              child: Text(
                "Order Lists",
                style: textEditStyle2,
              ),
            ),
            // SizedBox(
            //   height: 100,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _raiseButton(),
                SizedBox(
                  width: 20,
                ),
                _raiseButton1(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _raiseButton() {
    return SingleChildScrollView(
      child: Row(
        children: [
          ButtonTheme(
            minWidth: 150,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.green)),
              color: Colors.white,
              onPressed: () {
                _show();
              },
              child: Text(
                "Check Bill",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _raiseButton1() {
    return SingleChildScrollView(
      child: Row(
        children: [
          ButtonTheme(
            minWidth: 150,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.green)),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderpageScreen(),
                  ),
                );
              },
              child: Text(
                "AddItem",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showToast() {
    return Fluttertoast.showToast(
        msg: 'Thanks',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }
}
