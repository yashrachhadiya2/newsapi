

import 'package:flutter/material.dart';
import 'package:newsapi/screen/home/provider/homeProvider.dart';
import 'package:newsapi/screen/home/view/homePage.dart';
import 'package:newsapi/screen/home/view/homeScreen.dart';
import 'package:newsapi/screen/home/view/newsDataPage/businessNews.dart';
import 'package:newsapi/screen/home/view/newsDataPage/entertainmentNews.dart';
import 'package:newsapi/screen/home/view/newsDataPage/healthNews.dart';
import 'package:newsapi/screen/home/view/newsDataPage/indiaNews.dart';
import 'package:newsapi/screen/home/view/newsDataPage/scienceNews.dart';
import 'package:newsapi/screen/home/view/newsDataPage/topNews.dart';
import 'package:newsapi/screen/home/view/profilePage.dart';
import 'package:newsapi/screen/home/view/videoPage.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context)=>HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>HomeScreen(),
          'topnews':(context)=>TopNews(),
          'india':(context)=>India(),
          'health':(context)=>Health(),
          'homepage':(context)=>HomePage(),
          'profile':(context)=>ProfilePage(),
          'video':(context)=>VideoPage(),
          'business':(context)=>Business(),
          'entertainment':(context)=>Entertainment(),
          'science':(context)=>Science(),


        },
      ),
    ),
  );
}