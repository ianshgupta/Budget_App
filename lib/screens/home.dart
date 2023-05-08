import 'package:budget_app/data/listdata.dart';
import 'package:budget_app/data/model/add_data.dart';
import 'package:budget_app/data/utility.dart';
import 'package:budget_app/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var history;
  final box=Hive.box<Add_data>('add');

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
    return
      Scaffold(
        body: SafeArea(
          //! SafeArea is a widget that is used to automatically adjust the padding of a child widget to avoid overlapping with system-provided UI elements, such as the device's status bar, navigation bar, or keyboard.

          child: ValueListenableBuilder(
            valueListenable:box.listenable() ,
            builder: (context,value,child){

              return CustomScrollView(
              //! It allows developers to create a scrollable view with multiple child widgets
              slivers:
              //! Sliver is a portion of a scrolling view that can be scrolled independently of the rest of the view. they allow for very flexible and dynamic layouts that can adapt to changes in the content and user input. For example, if you have a list with multiple sections, you can use SliverList
              [
                SliverToBoxAdapter(
                  //! SliverToBoxAdapter is useful when you need to add a non-scrollable widget, such as a button or a text field, into a scrolling view that uses slivers
                  child: SizedBox(
                    height: 320,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 220,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(9),
                                  bottomLeft: Radius.circular(9),
                                ),
                              ),
                              child: Stack(
                                // !stack is a widget that allows you to stack other widgets on top of each other
                                children: [
                                  Positioned(
                                    top: 20,
                                    left: 339,
                                    child: ClipRRect(
                                      // * used to clip the corners of a child widget into a rounded rectangle shape
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          Icons.notifications,
                                          size: 33,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //wrapping up the whole column in Padding!
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      top: 25,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Good Day!',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 19.0,
                                            color: Color.fromARGB(255, 0, 55, 52),
                                          ),
                                        ),
                                        Text(
                                          'UBudget Gupta',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25.0,
                                            color: Color.fromARGB(255, 0, 84, 86),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          //! Positioned widget is used to position a child widget relative to its parent widget.
                          top: 140,
                          left: 37,
                          child: Container(
                            height: 170,
                            width: 320,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Whole Balance',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        Icons.more_horiz,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15.4,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        ' ${total()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.3,
                                  ),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 13.3,
                                            backgroundColor: Color.fromARGB(255, 100, 193, 255),
                                            child: Icon(
                                              Icons.arrow_downward,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 9.0,
                                      ),
                                      Text(
                                        'Income',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 85,
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            // ! CircleAvatar is a widget that is used to display a circular avatar or user profile picture
                                            radius: 13.3,
                                            backgroundColor: Color.fromARGB(255, 100, 193, 255),
                                            child: Icon(
                                              Icons.arrow_upward,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 9.0,
                                      ),
                                      Text(
                                        'Expenses',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 3.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 50,
                                    right: 21,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' ${income()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        ' ${expenses()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 19,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Transactions',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Color.fromARGB(255, 72, 72, 72),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SliverList(
                  //! SliverList is a widget that is used to create a scrollable list of variable-sized items
                  delegate: SliverChildBuilderDelegate(
                    //! It is used when you have a large number of items that cannot be created beforehand and must be created on-demand as the user scrolls.
                        (context, index)
                    //! arguments used in delegate
                        {
                          history = box.values.toList()[index];
                          return getList(history,index);
                        },
                    childCount: box.length,
                    //! the index parameter in delegate: SliverChildBuilderDelegate is automatically incremented by the ListView or GridView widget for each item in the list, so easy to create dynamic lists that can adapt to changes in the content and user input.
                  ),
                ),
              ],
            ); },
          ),
        ),
      );
  }
  Widget getList(Add_data history,int index){
    return Dismissible(key: UniqueKey(),
        onDismissed: (direction){
      history.delete();
        },
        child: geter(index,history));
  }
  ListTile geter(int index,Add_data history){
    return  ListTile(
      //! Listtile - is commonly used to create a single row in a scrolling list.
      leading: ClipRRect(
        //! Leading - It specifies a widget that is displayed at the beginning of the widget, typically on the left side.
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            'assets/images/${get()[index].image!}',
            //! getting the image path from the listdata.dart file
            // 'images/krishnaf.jpg',
            height: 36,
          )),
      title: Text(
        // 'Transfer',
        history.name
        , //! The exclamation mark (!) is used to indicate that the value of name is expected to be non-null, and it's safe to access it without null-checking.
        style: TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        // 'today',
       '${day[history.datetime.weekday -1]}  ${history.datetime.year}-${history.datetime.day}-${history.datetime.month}',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      trailing:
      //! it specifies a widget that is displayed at the end of the widget, typically on the right side.
      Text(
        // 'Rs. 63',
       history.amount,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          color:
          history.IN=='Income' ? Colors.green : Colors.red,
          //! ternaryoperator -  If purchase is true, the operator returns the Colors.red value, and if purchase is false, the operator returns the Colors.green value.
        ),
      ),
    );
  }
}