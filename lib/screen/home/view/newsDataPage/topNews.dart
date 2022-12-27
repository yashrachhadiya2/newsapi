import 'package:flutter/material.dart';
import 'package:newsapi/screen/home/modal/PostModal.dart';
import 'package:newsapi/screen/home/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class TopNews extends StatefulWidget {
  const TopNews({Key? key}) : super(key: key);

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {

  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {

    homeProviderFalse=Provider.of<HomeProvider>(context,listen: false);
    homeProviderTrue=Provider.of<HomeProvider>(context,listen: true);

    return SafeArea(child: Scaffold(
      body:FutureBuilder<PostModal>(
        future: homeProviderFalse!.apiCalling(),
        builder: (context,snapshot){
          
          if(snapshot.hasError){
             Text("${snapshot.error}");
          }
          else if(snapshot.hasData){
            PostModal postModal = snapshot.data!;

            return InkWell(
              onTap: (){

              },
              child: ListView.builder(
                  itemCount: postModal.articles!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff3f3f3f),


                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(

                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                      ),
                                      child: Image.network("${postModal.articles![index].urlToImage}",fit: BoxFit.fill,),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Container(
                                        height: 120,
                                        width: 120,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("${postModal.articles![index].title}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white70),overflow: TextOverflow.visible,),
                                            Text("${postModal.articles![index].description}",style: TextStyle(fontSize: 8,color: Colors.white54),overflow: TextOverflow.ellipsis,),
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(onPressed: (){
                                Navigator.pushNamed(context, 'details',arguments: postModal  .articles![index].url);
                              }, child: Text("Read News In Details")),
                            ],
                          ),
                        ),

                      ],
                    );
                  }),
            );

          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
