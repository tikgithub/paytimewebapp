import 'package:flutter/material.dart';
import 'package:webapp/screen/add_new_payment.dart';

// This is the type used by the popup menu below.
enum contextMenu { changepassword, logout }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'One';
  Widget injectScreen = Container();

  //Widget for current home screen
  Widget homeScreen() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed: null,
            child: Container(
              child: Image.asset('images/Dashboard.png'),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 100)),
          ),
        ],
      ),
    );
  }

  //Widget of navigation button
  Widget navigationButton(String text, Icon icon, Widget changeScreen) {
    return Container(
      width: 240,
      child: TextButton(
        onPressed: () {
          this.injectScreen = changeScreen;
          setState(() {});
        },
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            icon,
            SizedBox(
              width: 20,
            ),
            Text(text)
          ],
        ),
        style: TextButton.styleFrom(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            primary: Colors.black,
            backgroundColor: Colors.amberAccent),
      ),
    );
  }

//Navigation bar
  Widget navigationSideBar() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        navigationButton(
          'ໜ້າຫຼັກ',
          Icon(
            Icons.home_outlined,
            size: 30,
          ),
          homeScreen(),
        ),
        SizedBox(
          height: 5,
        ),
        navigationButton(
          'ເພີ່ມລາຍຈ່າຍໃໝ່',
          Icon(
            Icons.add_circle_outline,
            size: 30,
          ),
          AddNewPayment(),
        )
      ],
    );
  }

  @override
  // ignore: must_call_super
  void initState() {
    injectScreen = homeScreen();
  
  }

//Grouping navigationBar && Current injection screen
  Widget showContent() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            border: Border(
              right: BorderSide(
                style: BorderStyle.solid,
                width: 0.5,
                color: Colors.grey,
              ),
            ),
          ),
          width: 250,
          height: MediaQuery.of(context).size.height - 60,
          child: navigationSideBar(),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(color: Colors.white),
          width: MediaQuery.of(context).size.width - 250,
          height: MediaQuery.of(context).size.height - 55,
          child: injectScreen,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Image.asset(
            'images/slack.png',
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "PayTime",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ]),
        actions: [
          PopupMenuButton<contextMenu>(
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 25,
                  ),
                ],
              ),
            ),
            onSelected: (contextMenu result) {
              setState(() {});
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<contextMenu>>[
              PopupMenuItem<contextMenu>(
                value: contextMenu.changepassword,
                child: Row(
                  children: [
                    Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    Text(" Change password")
                  ],
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem<contextMenu>(
                value: contextMenu.logout,
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    Text(" Logout")
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: showContent(),
      ),
    );
  }
}
