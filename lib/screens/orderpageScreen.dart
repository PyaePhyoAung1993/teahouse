import 'dart:async';
import 'dart:convert';
import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:teahouse/HomePage.dart';
import 'package:teahouse/screens/breakfastTap.dart';
import 'package:teahouse/screens/deliveryTab.dart';
import 'package:teahouse/screens/lunchTab.dart';
import 'package:teahouse/screens/pendingOrder.dart';
import 'package:teahouse/style/textStyle.dart';
import 'package:http/http.dart' as http;

class OrderpageScreen extends StatefulWidget {
  var currentValueSelected1;
  var currentValueSelected;
  String token;
  Map<String, dynamic> userData;

  var id;
  var id1;
  var id2;

  var name;
  var name1;
  var name2;

  OrderpageScreen({Key key, this.token, this.userData}) : super(key: key);
  @override
  _OrderpageScreenState createState() => _OrderpageScreenState();
}

class _OrderpageScreenState extends State<OrderpageScreen>
    with TickerProviderStateMixin {
  TextEditingController floorController = TextEditingController();

  TabController tabController;

  @override
  void initState() {
    fetchData();
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  var api = 'http://theburmeseteahouse.kwintechnologies.com/api/getMealList';
  var res, datas;

  fetchData() async {
    res = await http.post(api, headers: {
      "Accept": 'application/json',
      'Authorization': "Bearer ${widget.token}"
    });

    datas = jsonDecode(res.body)['meal_lists'];

    widget.id = datas[0]['id'] ?? 1;
    widget.id1 = datas[1]['id'] ?? 2;
    widget.id2 = datas[2]['id'] ?? 3;

    widget.name = datas[0]['name'] ?? "Breakfast";
    widget.name1 = datas[1]['name'] ?? "Delivery";
    widget.name2 = datas[2]['name'] ?? "Lunch";
    print(widget.id);
    print(widget.name);
    print(widget.token);

    print('Response data GetMealList : $datas');
    print('String Response Meal  ${datas.toString()}');

    // print(id);
    // print(id1);
    // print(id2);
    // print(name);
    // print(name1);
    // print(name2);

    setState(() {});
  }

  var api1 =
      'http://theburmeseteahouse.kwintechnologies.com/api/getCuisineTypeList';
  var res1, datas1;

  fetchData1() async {
    res1 = await http.post(api1, headers: {
      "Accept": 'application/json',
      'Authorization': "Bearer ${widget.token}"
    }, body: {
      "cuisine_type_id": widget.id
    });

    print(widget.id);
    print(widget.token);

    datas1 = jsonDecode(res1.body)['cuisine_lists'];
    print('Response data Cuisine : $datas1');
    print('String Response Cuisine  ${datas1.toString()}');

    setState(() {});
  }

  var tableGroup = ['VIP', 'Normal', 'Outside'];
  var tableNo = [
    "N-10",
    "N-11",
    "N-12",
    "N-13",
    "N-14",
    "N-15",
    "N-16",
    "N-17",
    "N-18",
    "N-19",
    "N-110",
  ];

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
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => HomePage()));
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Order Page"),
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
        body: ListView(
          children: [
            Row(
              children: [
                //frist card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                    side: BorderSide(color: Colors.grey[100]),
                  ),
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height * 1,
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 12,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "floor",
                                  hintStyle: TextStyle(
                                    color: Colors.green,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                side: BorderSide(color: Colors.grey[200]),
                              ),
                              // margin: EdgeInsets.only(
                              //   top: 10,
                              // ),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 4.2,
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  child: ListView(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            widget.currentValueSelected1 == null
                                                ? ""
                                                : widget.currentValueSelected1,
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          DropdownButton<String>(
                                            items: tableGroup.map(
                                                (String dropDownStringItem) {
                                              return DropdownMenuItem<String>(
                                                value: dropDownStringItem,
                                                child: Text(
                                                  dropDownStringItem,
                                                  style: TextStyle(
                                                      color: Colors.green),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged:
                                                (String newValueSelected) {
                                              setState(() {
                                                widget.currentValueSelected1 =
                                                    newValueSelected;
                                              });
                                            },
                                            value: widget.currentValueSelected1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Container(
                          // margin: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: TabBar(
                                      controller: tabController,
                                      unselectedLabelColor: Colors.green,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.green),
                                      tabs: [
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.green,
                                                    width: 1)),
                                            child: res != null
                                                ? Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      widget.name,
                                                    ),
                                                  )
                                                : Text(""),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.green,
                                                    width: 1)),
                                            child: res != null
                                                ? Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      widget.name1,
                                                    ),
                                                  )
                                                : Text(""),
                                          ),
                                        ),
                                        Tab(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.green,
                                                    width: 1)),
                                            child: res != null
                                                ? Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      widget.name2,
                                                    ))
                                                : Text(""),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 400,
                                    child: TabBarView(
                                      controller: tabController,
                                      children: [
                                        BreakFastTab(
                                          id: widget.id,
                                          token: widget.token,
                                        ),
                                        DeliveryTab(
                                          id: widget.id1,
                                          token: widget.token,
                                        ),
                                        LunchTab(
                                          id: widget.id2,
                                          token: widget.token,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //second card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                    side: BorderSide(color: Colors.grey[200]),
                  ),
                  margin: EdgeInsets.only(top: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                side: BorderSide(color: Colors.grey[100]),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 12,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      widget.currentValueSelected == null
                                          ? ""
                                          : widget.currentValueSelected,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    DropdownButton<String>(
                                      items: tableNo
                                          .map((String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Text(
                                            dropDownStringItem,
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String newValueSelected) {
                                        setState(() {
                                          widget.currentValueSelected =
                                              newValueSelected;
                                        });
                                      },
                                      value: widget.currentValueSelected,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Card(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                  side: BorderSide(color: Colors.grey[200]),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 7,
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "open order",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.grey[200]),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 12,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Qty:",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 100),
                                  child: Text(
                                    "Total:",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.grey[200]),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 5,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Juice",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      "Apple",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      "Note",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    IconButton(
                                      color: Colors.green,
                                      icon: Icon(Icons.note_add),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "1500",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    IconButton(
                                      color: Colors.green,
                                      icon: Icon(Icons.add),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    IconButton(
                                      color: Colors.green,
                                      icon: Icon(Icons.remove),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      "Small",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (c) => PendingOrder()),
                            );
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Card(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17.0),
                                side: BorderSide(color: Colors.grey[100]),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 7,
                                height: MediaQuery.of(context).size.height / 12,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Pending order",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
