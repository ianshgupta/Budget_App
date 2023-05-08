import 'package:budget_app/data/model/add_data.dart';
import 'package:budget_app/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final box =Hive.box<Add_data>('add');
  DateTime date = new DateTime.now();
  String? selectedItem;
  String? selectedItemi;
  final TextEditingController explain_C=TextEditingController();
  FocusNode ex=FocusNode();
  final TextEditingController amount=TextEditingController();
  FocusNode am = FocusNode();
  final List<String> _item=[
    "Food",
    "Transfer",
    "Transportation",
    "Education",
  ];
  final List<String> _itemi=[
    "Income",
    "Expand",
  ];
  @override
  void iniState(){
    super.initState();
    ex.addListener(() {
      setState(() {

      });
    });
    am.addListener(() {
      setState(() {

      });
    });
  }
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
                    child: main_container(),
                    ),
              ],
            ),
        ),
      );
  }
  Container main_container() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 550,
      width: 340,
      child: Column(
        children: [
          SizedBox(height: 15),
          name(),
          SizedBox(height: 15),
          explain(),
          SizedBox(height: 15),
          amount_(),
          SizedBox(height: 15),
          How(),
          SizedBox(height: 15),
          date_time(),
          SizedBox(height: 30,),
          save(),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  MouseRegion save() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
              var Add=Add_data(amount.text, date, explain_C.text, selectedItem!, selectedItemi!);
              box.add(Add);

               Navigator.push(
                context,
               MaterialPageRoute(builder: (context) =>  nav()),
           );
          amount.clear();
          explain_C.clear();
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.pink,
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
              firstDate: DateTime(2023),
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

  Padding How() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Color(0xffC5C5C5),
          ),
        ),
        child: DropdownButton<String>(
          value: selectedItemi,
          onChanged: ((value) {
            setState(() {
              selectedItemi = value!;
            });
          }),
          items: _itemi
              .map((e) => DropdownMenuItem(
            value: e,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text(
                    e,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemi
              .map((e) => Row(
            children: [Text(e)],
          ))
              .toList(),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'How',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Padding amount_() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: am,
        controller: amount,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'amount',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xff368983))),
        ),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        focusNode: ex,
        controller: explain_C,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'explain',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xff368983))),
        ),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Color(0xffC5C5C5),
          ),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          onChanged: ((value) {
            setState(() {
              selectedItem = value!;
            });
          }),
          items: _item
              .map((e) => DropdownMenuItem(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    child: Image.asset('assets/images/${e}.png'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    e,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            value: e,
          ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map((e) => Row(
            children: [
              Container(
                width: 42,
                child: Image.asset('images/${e}.png'),
              ),
              SizedBox(width: 5),
              Text(e)
            ],
          ))
              .toList(),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Name',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(
                      'Adding',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),

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
//   Container main_container(){
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white
//       ),
//       height: 400,
//       width: 340,
//       child: Column(
//         children: [
//           SizedBox(height: 30,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             width: 300,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(width: 1,color: Colors.black)
//             ),
//
//             child: DropdownButton<String>(
//               value: selectedItem,
//                 items:_item.map((e) => DropdownMenuItem(
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 40,
//                         child: Image.asset("assets/images/${e}.png"),
//                       ),
//                       SizedBox(width: 10,),
//                       Text(
//                         e,
//                         style: TextStyle(fontSize: 18),
//                       )
//                     ],
//                   ),
//                 ),
//             value:e,
//             )).toList(),
//                 selectedItemBuilder: (BuildContext context)=>_item
//                 .map((e)=>Row(
//                   children: [
//                     Container(
//                       width: 42,
//                         child: Image.asset('assets/images/${e}.png'),
//                 ), SizedBox(height: 10,),
//                     Text(e)
//
//
//                   ],
//                 )).toList(),
//                 hint: Padding(
//                   padding: const EdgeInsets.only(top: 12),
//                   child: Text('Name',style: TextStyle(
//                     color: Colors.grey,
//                   ),),
//                 ),
//                 dropdownColor: Colors.white,
//                 isExpanded: true,
//                 underline: Container(),
//                 onChanged: ((value){
//               setState(() {
//                 selectedItem=value!;
//               });
//             })),
//           ),
//           ),
//           SizedBox(height:20 ,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: TextField(
//               focusNode:ex ,
//              controller: explain_C,
//               decoration: InputDecoration(
//                contentPadding:
//                EdgeInsets.symmetric(horizontal: 15,vertical: 15),
//                 labelText: 'explain',
//                 labelStyle: TextStyle(
//                   fontSize: 17,color: Colors.grey.shade500,),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(width: 2,color: Colors.grey),),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(width: 2,color: Colors.pink),
//                 )
//               ),
//             ),
//           ),
//           SizedBox(height: 20,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: TextField(
//               keyboardType: TextInputType.number,
//               focusNode:am ,
//               controller: amount,
//               decoration: InputDecoration(
//                   contentPadding:
//                   EdgeInsets.symmetric(horizontal: 15,vertical: 15),
//                   labelText: 'Amount',
//                   labelStyle: TextStyle(
//                     fontSize: 17,color: Colors.grey.shade500,),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(width: 2,color: Colors.grey),),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(width: 2,color: Colors.pink),
//                   )
//               ),
//             ),
//           ),
//           SizedBox(height: 20,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               width: 300,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(width: 1,color: Colors.black)
//               ),
//
//               child: DropdownButton<String>(
//                   value: selectedItem1,
//                   items:_item1.map((e) => DropdownMenuItem(
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Row(
//                         children: [
//
//                           SizedBox(width: 10,),
//                           Text(
//                             e,
//                             style: TextStyle(fontSize: 18),
//                           )
//                         ],
//                       ),
//                     ),
//                     value:e,
//                   )).toList(),
//                   selectedItemBuilder: (BuildContext context)=>_item1
//                       .map((e)=>Row(
//                     children: [
//                       Container(
//                         width: 42,
//                       ), SizedBox(height: 10,),
//                       Text(e)
//
//
//                     ],
//                   )).toList(),
//                   hint: Padding(
//                     padding: const EdgeInsets.only(top: 12),
//                     child: Text('Type',style: TextStyle(
//                       color: Colors.grey,
//                     ),),
//                   ),
//                   dropdownColor: Colors.white,
//                   isExpanded: true,
//                   underline: Container(),
//                   onChanged: ((value){
//                     setState(() {
//                       selectedItem1=value!;
//                     });
//                   })),
//             ),
//           ),
//           SizedBox(height: 20,),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(width: 2,color: Colors.grey),
//             ),
//             width: 300,
//               child: TextButton(
//                 onPressed: ()async{
//                 DateTime? newDate=await showDatePicker(context: context, initialDate: date, firstDate: DateTime(2023), lastDate: DateTime(2100));
//                 if(newDate==null) return;
//                 setState(() {
//                   date=newDate!;
//                 });
//                 },
//                 child: Text('Date:${date.year}/${date.day}/${date.month}', style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.black,
//                 ),),
//               ),
//           ),
//           SizedBox(height: 30,),
//
//           MouseRegion(
//             cursor: SystemMouseCursors.click,
//             child: GestureDetector(
//               onTap: (){
//              var add=Add_data(amount.text,date,explain_C.text, selectedItem!,selectedItem1!);
//              box.add(add);
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) =>  nav()),
//              );
//                 amount.clear();
//                 explain_C.clear();
//
//               },
//               child: Container(
//
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.pinkAccent,
//                 ),
//                 width: 120,
//                 height: 50,
//                 child: Text(
//                   'Save',style: TextStyle(
//                   fontFamily: 'f',
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                   fontSize: 17,
//                 ),
//                 ),
//               ),
//             ),
//           )
//
//
//         ],
//       ) ,
//     );
//   }
// Column  background_container(BuildContextcontext){
//   return Column(
//     children: [
//
//     Container(
//     width: double.infinity,
//     height: 240,
//     decoration: BoxDecoration(
//       color: Colors.pink,
//       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
//     ),
//     child: Column(
//       children: [
//         SizedBox(height: 40,),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//
//               Text('Adding',style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//
//               ),)
//             ],
//           ),
//         )
//
//       ],
//     ),
//   )]);
// }}