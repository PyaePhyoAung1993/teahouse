import 'package:flutter/material.dart';
import 'package:teahouse/HomePage.dart';
import 'package:teahouse/screens/myorderDetailPage1.dart';
import 'package:teahouse/style/textStyle.dart';

class PendingOrder extends StatefulWidget {
  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
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
                    "Order Successful",
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
                  'Successful',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (c) => MyorderDetailPage1()),
                    );
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Burma Tea House"),
        backgroundColor: Colors.green,
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
        children: [
          Text(
            "Burmese Tea House",
            style: textEditStyle2,
          ),
          Divider(
            color: Colors.green,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Name",
                style: textEditStyle3,
              ),
              Text(
                "Option",
                style: textEditStyle3,
              ),
              Text(
                "Size",
                style: textEditStyle3,
              ),
              Text(
                "Quantiy",
                style: textEditStyle3,
              ),
              Text(
                "Price",
                style: textEditStyle3,
              ),
              Text(
                "Note",
                style: textEditStyle3,
              ),
            ],
          ),
          Divider(
            color: Colors.green,
          ),
          // Container(
          //     margin: EdgeInsets.only(top: 200),
          //     child: res != null
          //         ? ListView.builder(
          //             itemCount: drinks.length,
          //             itemBuilder: (context, index) {
          //               var drink = drinks[index];
          //               return Column(
          //                 // mainAxisAlignment: MainAxisAlignment.center,
          //                 // crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Container(
          //                     // color: Colors.red,
          //                     margin: EdgeInsets.only(top: 5),
          //                     height: 40,
          //                     child: Row(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Container(
          //                           alignment: Alignment.center,
          //                           margin: EdgeInsets.only(left: 10),
          //                           width: 20,
          //                           child: Text('${++index}.'),
          //                         ),
          //                         Container(
          //                           alignment: Alignment.center,
          //                           margin: EdgeInsets.only(left: 3),
          //                           width:
          //                               MediaQuery.of(context).size.width / 2,
          //                           child: Text(
          //                             "${drink["item_name"]}",
          //                             textAlign: TextAlign.start,
          //                             // style: textedit,
          //                           ),
          //                         ),
          //                         Container(
          //                           alignment: Alignment.center,
          //                           margin: EdgeInsets.only(left: 10),
          //                           width: 20,
          //                           child: Text(
          //                             "${drink["quantity"]}",
          //                             style: textedit,
          //                           ),
          //                         ),
          //                         Container(
          //                           alignment: Alignment.center,
          //                           margin: EdgeInsets.only(left: 55),
          //                           width: 40,
          //                           child: Text(
          //                             "${drink["price"]}",
          //                             style: textedit,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   )
          //                 ],
          //               );
          //             },
          //           )
          //         : Text('   '),
          //   ),

          Container(
            margin: EdgeInsets.only(top: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _raiseButton(),
                _raiseButton1(),
              ],
            ),
          )
        ],
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
                Navigator.of(context).pop(true);
              },
              child: Text(
                "CANCEL",
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
                _show();
              },
              child: Text(
                "OK",
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
}
