import 'dart:io';

import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const url = "https://play.google.com/store/apps";

class _MyHomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _selected = 0;
  void changeSelected(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double H = MediaQuery.of(context).size.height;
    final double W = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'যুক্তবর্ণের তালিকা।',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        drawer: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Container(
            width: 200,
            child: SafeArea(
              child: Drawer(
                child: GestureDetector(
                  onTap: () {
                    if (_scaffoldKey.currentState!.isDrawerOpen) {
                      _scaffoldKey.currentState!.openEndDrawer();
                    } else {
                      _scaffoldKey.currentState!.openDrawer();
                    }
                  },
                  child: ListView(
                    children: [
                      Container(
                        height: 200,
                        child: DrawerHeader(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/image/imag1.png'),
                              fit: BoxFit.cover,
                            )),
                            child: Column(
                              children: [],
                            )),
                      ),
                      ListTile(
                        selected: _selected == 0,
                        leading: Icon(
                          Icons.star_rate_sharp,
                          size: 28,
                        ),
                        title: Text(
                          'Rate App',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                        onTap: () {
                          launch(url);
                          changeSelected(0);
                        },
                      ),
                      ListTile(
                        selected: _selected == 1,
                        leading: Icon(
                          Icons.share,
                          size: 28,
                        ),
                        title: Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                        onTap: () {
                          WcFlutterShare.share(
                              sharePopupTitle: 'Share',
                              subject: 'This is subject',
                              text: "",
                              mimeType: 'text/plain');

                          changeSelected(1);
                        },
                      ),
                      new Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      ListTile(
                        selected: _selected == 2,
                        leading: Icon(
                          Icons.account_circle,
                          size: 28,
                        ),
                        title: Text(
                          'About Us',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ()));
                          changeSelected(2);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            alert(
              context,
              title: Text("যুক্তবর্ণ"),
              content: Text("আপনি প্রস্থান করতে চান??"),
              textOK: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        exit(0);
                      },
                      child: Text("হ্যাঁ")),
                  SizedBox(
                    width: 30,
                  ),
                  Text("না"),
                ],
              ),
            );
            return true;
          },
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 1.10,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          )
                        ],
                      ),
                      child: Center(
                          child: Card(
                        shadowColor: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 15, right: 10),
                          child: Text(
                            'বাংলায় ব্যবহৃত ২৮৬টি যুক্তবর্ণ দেওয়া হয়েছে, এর বাইরে কোন যুক্তবর্ণ সম্ভবত বাংলায় প্রচলিত নেই।',
                            style: TextStyle(
                                fontSize: W * 0.04, color: Colors.red),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ))),
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                'প্রথম অংশ।',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.chevron_right, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  'দ্বিতীয় অংশ।',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right, color: Colors.white),
                              ],
                            ),
                          )),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.white))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  'তৃতীয় অংশ।',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Icon(Icons.chevron_right, color: Colors.white),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: BottomAppBar(
          color: Colors.blue,
        ),
      ),
    );
  }
}
