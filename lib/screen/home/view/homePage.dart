import 'package:flutter/material.dart';
import 'package:newsapi/screen/home/view/newsDataPage/businessNews.dart';
import 'package:newsapi/screen/home/view/newsDataPage/entertainmentNews.dart';
import 'package:newsapi/screen/home/view/newsDataPage/healthNews.dart';
import 'package:newsapi/screen/home/view/newsDataPage/indiaNews.dart';
import 'package:newsapi/screen/home/view/newsDataPage/scienceNews.dart';
import 'package:newsapi/screen/home/view/newsDataPage/topNews.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: SafeArea(child: Scaffold(
        backgroundColor: Colors.black87,
          body: Column(
            children: [
              TabBar(isScrollable: true,
                tabs: [
                  Tab(child: Text("TOP NEWS"),),
                  Tab(child: Text("INDIA"),),
                  Tab(child: Text("HEALTH"),),
                  Tab(child: Text("BUSINESS"),),
                  Tab(child: Text("ENTERTAIMENT"),),
                  Tab(child: Text("SCIENCE"),),
                ],
              ),

              Expanded(
                child: TabBarView(children: [
                  TopNews(),
                  India(),
                  Health(),
                  Business(),
                  Entertainment(),
                  Science(),

                ]),
              )
            ],
          ),


      )),
    );
  }
}
