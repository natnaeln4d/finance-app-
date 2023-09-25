// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/model/add_date.dart';
class Add_Screen extends StatefulWidget {
  const Add_Screen({Key? key}) : super(key: key);

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> 
{

  // final box = Hive.box<Add_data>('data');
  DateTime date = new DateTime.now(); 
  String? selctedItem;
  String? selctedItemi;
  final TextEditingController explian_C=TextEditingController();
  FocusNode ex=FocusNode();
   final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
  final List<String> _item = [
    "up",
    "star",
    "star",
    "up",
    "Transfer"
   
  ];
  final List<String> _itemei = [
    'up',
    "Transfer",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {
      setState(() {
       
      });
      amount_.addListener(() {
      setState(() {});
    });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                
                ),
                height: 550,
                width: 340,
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    name(),
                    SizedBox(height: 30,),
                    explain(),
                    SizedBox(height: 30,),
                    amount(),
                    SizedBox(height: 30,),
                    how(),
                    SizedBox(height: 30,),
                    date_time(),
                    Spacer(),
                    save()
                    
                    



                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget save() {
    return GestureDetector(
                      onTap: () {
                        // var add = Add_data(
                        //     selctedItemi!, amount_c.text, date, explian_C.text, selctedItem!);
                        // // box.add(add);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff368983),
                        ),
                        width: 120,
                        height: 50,
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontFamily: 'f',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    );
  }

  Widget date_time() {
    return Container(
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Color(0xffC5C5C5))),
                    width: 300,
                    child: TextButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100));
                        if (newDate == Null) return;
                        setState(() {
                          date = newDate!;
                        });
                      },
                      child: Text(
                        'Date : ${date.year} / ${date.day} / ${date.month}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
  }

  Padding how() {
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Color(0xffc5c5c5
                        )
                        ),                     
                    ),
                    child: DropdownButton<String>(
                      value: selctedItemi,
                      items:_itemei
                          .map((e) =>DropdownMenuItem(
                             child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    child: Image.asset('assets/images/${e}.png'),
                                  ),
                                  SizedBox(width:40 ,),
                                  Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ]),
                             ),
                             value:e ,
                             )
                            ).toList(),
                            selectedItemBuilder: (BuildContext context) => _item
                             .map((e) => Row(
                                  children: [
                                    Container(
                                      width: 42,
                                      child: Image.asset('assets/images/${e}.png'),
                                    ),
                                    SizedBox(width: 5),
                                    Text(e,
                                    )
                                  ],
                                ))
                            .toList(),
                            hint: Text(
                              'Name',
                              style: TextStyle(
                                color:Colors.grey ),
                            ),
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            underline: Container(
                              
                            ),
                      onChanged: ((value){
                      setState(() {
                        selctedItemi=value;
                      });
                    }),),
                  ),
                );
  }

  Padding amount() {
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    focusNode: amount_,
                    controller: amount_c,
                    decoration: InputDecoration(
                      
                      contentPadding:
                       EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15
                      ),
                      labelText: 'amount',
                      labelStyle: TextStyle(fontSize: 17,color: Colors.grey.shade500),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 2,color: Color.fromARGB(195, 186, 188, 175))),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 2,color: Color.fromARGB(195, 33, 240, 95))),
                      
                    ),
                  ),
                );
  }

  Padding explain() {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      focusNode: ex,
                      controller: explian_C,
                      decoration: InputDecoration(
                        contentPadding:
                         EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15
                        ),
                        labelText: 'explain',
                        labelStyle: TextStyle(fontSize: 17,color: Colors.grey.shade500),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 2,color: Color.fromARGB(195, 186, 188, 175))),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 2,color: Color.fromARGB(195, 33, 240, 95))),
                        
                      ),
                    ),
                  );
  }

  Padding name() {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: Color(0xffc5c5c5
                          )
                          ),                     
                      ),
                      child: DropdownButton<String>(
                        value: selctedItem,
                        items:_item
                            .map((e) =>DropdownMenuItem(
                               child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      child: Image.asset('assets/images/${e}.png'),
                                    ),
                                    SizedBox(width:40 ,),
                                    Text(
                                      e,
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    )
                                  ]),
                               ),
                               value:e ,
                               )
                              ).toList(),
                              selectedItemBuilder: (BuildContext context) => _item
                               .map((e) => Row(
                                    children: [
                                      Container(
                                        width: 42,
                                        child: Image.asset('assets/images/${e}.png'),
                                      ),
                                      SizedBox(width: 5),
                                      Text(e,
                                      )
                                    ],
                                  ))
                              .toList(),
                              hint: Text(
                                'Name',
                                style: TextStyle(
                                  color:Colors.grey ),
                              ),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              underline: Container(
                                
                              ),
                        onChanged: ((value){
                        setState(() {
                          selctedItem=value;
                        });
                      }),),
                    ),
                  );
  }

  Column background_container(BuildContext context) {
    return Column(
            children: [
              Container(
                width: double.infinity,
                height: 240,
                decoration: const BoxDecoration(
                  color: Color(0xff368983),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children:  [
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child:Icon(
                                Icons.arrow_back,
                                 color:Colors.white , 
                                 )
                                 
                          ),
                               Text(
                                'Adding',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),
                               ),
                               Icon(
                                Icons.attach_file_outlined,
                                color: Colors.white,
                               )
                        ],
                      ),
                    )
                    
                  ],
                ),
              ),
            ],
          );
  }
}
