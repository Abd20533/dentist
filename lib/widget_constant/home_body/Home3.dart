// import 'package:dentist/core/constant/my_color.dart';
// import 'package:dentist/core/mycore/extentions.dart';
// import 'package:dentist/modules/products/products.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
//
// class Home3 extends StatelessWidget {
//   const Home3({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//
//       Material(
//         child: BlocProvider(
//         create: (context) => UserCubitHome3()..getHome3(),
//
//
//           child: BlocConsumer<UserCubitHome3, Home3State>(
//
//             listener: (context, state) {
//
//             },
//             builder: (context, state) {
//               var home3Controller= UserCubitHome3.get(context);
//
//               return
//
//               Scaffold(
//               backgroundColor: Colors.white,
//               body: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(children: [
//
//               const Divider(color: AppMyColor.blackApp,),
//               Padding(
//               padding: const EdgeInsets.only(bottom: 20.0),
//               child: Card(
//               elevation: 0,
//               color: AppMyColor.redApp,
//               child: Column(
//               children: [
//               Card(
//               shape:  Border.all(width: 2,color: Colors.white,style: BorderStyle.none,),
//             elevation: 5,
//
//             shadowColor:AppMyColor.redApp.withOpacity(0.5) ,
//             child: Container(
//             color:Colors.white,
//
//             height:
//             MediaQuery.of(context).size.height/2 +28,
//             child:  Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child:
//             state is Home3SuccessState?
//
//
//             ListView.separated(
//
//             separatorBuilder: (context, index) {
//             return
//             const SizedBox(height: 10,);
//
//             },
//
//             itemBuilder: (context, index) => CardInHome3(i: (1+index).toString(),
//             product: home3Controller.productsResponse!.products[index],
//             ),
//             itemCount: 13,
//             // itemCount: home3Controller.productsResponse!.products.length,
//             ):
//           const CircularProgressIndicator(color: AppMyColor.red,).center(),
//             )).center(),
//             ),
//             ],
//             ),
//             ),
//
//             ),
//
//
//
//             ],),
//             ),
//
//
//             );
//             },
//             ),),
//       );
//
//
//
//
//
//
//
//   }
// }
//
//
//
//
//
// class CardInHome3 extends StatelessWidget {
//   final Product? product;
//   final String i;
//
//   const CardInHome3({super.key, required this.i, this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       height: 170,
//       child: Card(
//         // shape: Border.all (color: AppMyColor.blackApp,width: 2,style: BorderStyle.solid),
//         shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: const BorderSide(color: AppMyColor.blackApp,width: 2,style: BorderStyle.solid)),
//         color: AppMyColor.redApp,
//
//         elevation: 12,
//         shadowColor: AppMyColor.blackApp,
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               // fit: BoxFit.fill,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
//                   child: Container(
//                     decoration:  BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//
//                       color: Colors.white,
//
//                     ),
//                     child:  CircleAvatar(
//                       radius: 50,
//                       backgroundImage: AssetImage("assets/images/imageFood$i.png"),),
//                   ).onTap(() {
//
//
//                     Get.off(() => Products(product: product!,));
//                   },),
//                 ).center(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
//                   child:
//
//                       Column(children: [
//
//                         SizedBox(
//
//                           width: 120,
//                           height: 30,
//
//                           child: Text(product!.name
//
//                         ,style: const TextStyle(color: AppMyColor.whiteTextApp,fontSize: 18),).center(),
//                         ),
//
//
//
//                         SizedBox
//                           (width: 120,child:  Text(" OUR PRODUCTS IS GOOD IN THE WORD"
//                           ,style: TextStyle(color: AppMyColor.whiteTextApp.withOpacity(0.8),fontSize: 12),).center(),),
//
//                          const SizedBox(
//                           height: 40,
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(vertical: 8.0),
//                               child: Row(
//                               crossAxisAlignment:CrossAxisAlignment.end ,
//                               mainAxisAlignment:MainAxisAlignment.end ,
//                                 children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                                   child: Icon(Icons.add_shopping_cart,color: Colors.green,),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                                   child: Icon(Icons.favorite,color: Colors.red,),
//                                 ),
//
//
//                               ],),
//                             ))
//                       ],)
//
//                  ).center(),
//               ],
//             )
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
