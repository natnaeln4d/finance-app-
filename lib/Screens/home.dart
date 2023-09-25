// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/listdata.dart';

class Home extends StatefulWidget {
   const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var history;
  
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'friday',
    'saturday',
    'sunday'
  ];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 350,child: _head(),)),
            SliverToBoxAdapter(
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                              "Transction History",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color:Colors.black
                              ),
                            ),
                             Text(
                              "see all",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color:Colors.black
                              ),
                            ),
              
                ]),
              ) ,
            ),
            SliverList(delegate: SliverChildBuilderDelegate(
              (context,index){
                return ListTile(
                  leading: ClipRRect(
                    borderRadius:BorderRadius.circular(5),
                    child:Image.asset('assets/images/${gett()[index].image!}',
                    height: 40) ),
                    title: Text
                    (gett()[index].name!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17
                    ),),
                    subtitle:  Text(
                      gett()[index].time!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),),
                    trailing:  Text(
                     gett()[index].fee!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: gett()[index].buy! ? Colors.red :Colors.green
                    ),),
                );
              },
              childCount: gett().length,
            ))
          ],
        ),)
      );
}
Widget _head(){
  return Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                    color: Color(0xff368983),
                    borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(15),
                      bottomRight:Radius.circular(15)
                    )
                  ),
                  child: Stack(children: [
                    Positioned(
                      top: 35,
                      left: 340,
                      child:
                    Container(
                      height: 40,
                      width: 40,
                      color: Color.fromRGBO(250, 250, 250, 0.1),
                      // ignore: prefer_const_constructors
                      child: Icon(
                        Icons.notification_add_outlined,
                        size:30,
                        color: Colors.white,
                      ),
                    )
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.only(top:30,left:10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good afternoon",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color:Color.fromARGB(255, 224, 223,223)
                            ),
                          ),
                          Text(
                            "Natnael Getachew",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color:Colors.white        
                              ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
            Positioned(
              top: 160,
              left: 37,
              child: Container(
                height: 170,
                width: 320 ,
                decoration: BoxDecoration(
                  boxShadow:[
                    BoxShadow(
                      color: Color.fromRGBO(47, 127, 121, 0.3),
                      offset: Offset(0,6),
                      blurRadius: 12,
                      spreadRadius: 6
                    )
                  ] ,
                color: Color.fromARGB(255, 47, 125, 121),
                borderRadius: BorderRadius.circular(15)
                ),
                child: Column(children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(
                              "Total Balance",
                              style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:Color.fromARGB(255, 224, 223,223)
                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            )
                      
                    ],),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.only(left:15),
                    child: Row(
                      children: [
                        Text('\$2,957',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor:Color.fromARGB(255, 85, 145, 141) ,
                              child: Icon(
                               Icons.arrow_downward,
                               color: Colors.white,
                               size: 19,
                              ),
                            ),
                            SizedBox(width: 7),
                            Text(
                               'Income',
                                style:TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromARGB(255,216, 216, 216)
                                ))
                          ],
                        ),
                         Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor:Color.fromARGB(255, 85, 145, 141) ,
                          child: Icon(
                           Icons.arrow_upward,
                           color: Colors.white,
                           size: 19,
                          ),
                        ),
                        SizedBox(width: 7),
                        Text(
                           'Expense',
                            style:TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255,216, 216, 216)
                            ))
                      ],
                    ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:30 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ 1245',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white                      
                          )
                          ),
                          Text('\$ 245',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white                      
                          )
                          )
                      ],
                    ),
                  )
                ]),
              ),
            )
          ],
        );
}
  }