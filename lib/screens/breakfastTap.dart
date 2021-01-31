import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BreakFastTab extends StatefulWidget {
  var id;
  String token;

  BreakFastTab({Key key, this.id, this.token}) : super(key: key);

  @override
  _BreakFastState createState() => _BreakFastState();
}

class _BreakFastState extends State<BreakFastTab> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  var api =
      'http://theburmeseteahouse.kwintechnologies.com/api/getCuisineTypeList';
  var res, datas;

  void fetchData() async {
    res = await http.post(api, headers: {
      "Accept": 'application/json',
      'Authorization': "Bearer ${widget.token}"
    }, body: {
      "meal_id": "${widget.id}",
    });

    print(widget.id);
    print(widget.token);

    datas = jsonDecode(res.body)['cuisine_lists'];
    print('Response data Cuisine : $datas');
    print('String Response Cuisine  ${datas.toString()}');

    setState(() {});
  }

  final List<Map> myProducts =
      List.generate(10, (index) => {"id": index, "name": "Product $index"})
          .toList();

  Future<bool> _show() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Options',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              content: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.grey[100]),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Fried Rice",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              "Pork Rib",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              "4500",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                              ),
                            ),
                            IconButton(
                              color: Colors.green,
                              icon: Icon(Icons.add_circle),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              res != null
                  ? ListView.builder(
                      itemCount: datas.length,
                      itemBuilder: (context, index) {
                        var data = datas[index];
                        return RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)),
                          color: Colors.red,
                          onPressed: () {},
                          child: Text("${data['cuisine_type_name']}"),
                        );
                      },
                    )
                  : CircularProgressIndicator(
                      backgroundColor: Colors.green,
                    ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
              ),
              itemCount: myProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.grey[100]),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image(
                            color: Colors.green,
                            image: AssetImage(
                              "assets/images/a.png",
                            )),
                        Text(
                          "Chicken Fried",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Size",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              "Prize",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              color: Colors.green,
                              icon: Icon(Icons.add_circle),
                              onPressed: () {
                                _show();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Widget _raiseButton() {
  //   return SingleChildScrollView(
  //     child: Row(
  //       children: [
  //         ButtonTheme(
  //           child: RaisedButton(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(18.0),
  //                 side: BorderSide(color: Colors.green)),
  //             color: Colors.white,
  //             onPressed: () {},
  //             child: res != null
  //                 ? Text(
  //                     datas[8]["cuisine_type_name"],
  //                     style: TextStyle(
  //                       color: Colors.green,
  //                     ),
  //                   )
  //                 : Text(""),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
