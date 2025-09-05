import 'package:dentist/core/constant/AppColor.dart';
import 'package:flutter/material.dart';

class Home1 extends StatelessWidget {

  final List<Widget> tabs;
  final  int length;
  const Home1({super.key,  this.tabs= const [
    Tab(text: '  All  '),
    Tab(text: '  Recommended  '),
    Tab(text: '  Popular   '),

  ],  this.length=3});

  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      length: length,
      initialIndex: 1,
      child: Scaffold(

        body:   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(

          child: Column(
            children: [
              Container(
                decoration:BoxDecoration(

                    color:AppMyColor.redApp,

                    borderRadius: BorderRadius.circular(28)) ,

                height: MediaQuery.of(context).size.height/10,

                child: TabBar(

                    isScrollable: true,
                    // overlayColor: ,
                     unselectedLabelColor: Colors.white,
                    indicatorColor: AppMyColor.white,
                    indicatorWeight: 2,
                    indicator: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppMyColor.redApp
                                .withOpacity(0.0),

                            ///3
                            spreadRadius: 3,
                            offset: const Offset(0, 0),

                            ///2
                            blurRadius: 2),
                      ],
                      color: AppMyColor.white,
                      borderRadius: BorderRadius.circular(20),
                      border: const Border(
                          left: BorderSide(
                              width: 2, color: Colors.transparent),
                          top: BorderSide(
                              width: 2, color: Colors.transparent),
                          right: BorderSide(
                              width: 2, color: Colors.transparent),
                          bottom: BorderSide(
                              width: 2, color: Colors.transparent)),
                    ),
                    labelColor:
                    AppMyColor.redApp,
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 17, color: Colors.white),
                    labelStyle: const TextStyle(fontSize: 24),
                    tabs:tabs
                   ),
              ),
              // Divider(color: AppMyColor.redApp,)
const SizedBox(height: 10,),
              Expanded(
                child: TabBarView(children: [Container(
                  color: AppMyColor.redApp,
                  child: ListViewInHome1(height: 8* MediaQuery.of(context).size.height/10),
                ),
                  Container(
                    color: AppMyColor.white,
                    child: ListViewInHome1(height: 8* MediaQuery.of(context).size.height/10),
                  ),
                  Container(
                    color: AppMyColor.redApp,
                    child: ListViewInHome1(height: 8* MediaQuery.of(context).size.height/10),
                  ),


                ]
                ),
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}


class ListViewInHome1 extends StatelessWidget {
  final double  height;
  const ListViewInHome1({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
     child: ListView.separated(
         scrollDirection: Axis.horizontal,
         itemBuilder: (context, index) {

       return  ItemInListView(i: (index+1).toString(),);

       
       
     }, separatorBuilder: (context, index) => const SizedBox(width: 6,), itemCount: 14),
      
      
      
    );
  }
}
class ItemInListView extends StatelessWidget {
  final String i;
  const ItemInListView({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(

            border: Border.all(width: 1,color: AppMyColor.blackTextApp),

            borderRadius: BorderRadius.circular(12),color: AppMyColor.white),

        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: 160,
              decoration: BoxDecoration(
                shape:BoxShape.rectangle ,
                border: Border.all(width: 2,color: AppMyColor.blackTextApp,style: BorderStyle.solid),

                image:  DecorationImage(image: AssetImage("assets/images/imageFood$i.png"),fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(30),
                color:
                AppMyColor.redApp.withOpacity(0.2),
              ),

            ),
          )
          ,const Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 14.0),
            child: SizedBox(child: Text("OUR PRODUCTS IS GOOD IN THE WORD",style: TextStyle(color: AppMyColor.blackTextApp,fontWeight: FontWeight.bold,),),),
          )

        ],),

      ),
    );
  }
}
