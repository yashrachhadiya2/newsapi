import 'package:flutter/material.dart';
import 'package:newsapi/screen/home/modal/PostModal.dart';
import 'package:newsapi/screen/home/view/homePage.dart';
import 'package:newsapi/screen/home/view/profilePage.dart';
import 'package:newsapi/screen/home/view/videoPage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../provider/homeProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
HomeProvider? homeProviderTrue;
HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {

    homeProviderFalse=Provider.of<HomeProvider>(context,listen: false);
    homeProviderTrue=Provider.of<HomeProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text("Daily 24/7 News"),
          actions: [
            IconButton(onPressed:()async{
              if(await Permission.camera.isDenied )
                {
                  Permission.camera.request();
                }
            } , icon: Icon(Icons.settings),),
          ],

        ),
        body: IndexedStack(
          index: homeProviderTrue!.i,
          children: [
            HomePage(),
            VideoPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.slow_motion_video_rounded,color: Colors.white,),label: "Video",),
            BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.white,),label: "Profile",),
          ],
          currentIndex: homeProviderTrue!.i,
          onTap: (index){
            homeProviderTrue!.bootomindex(index);
          },

        ),

      ),
    );
  }
}
