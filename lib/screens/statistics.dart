import 'package:budget_app/data/model/add_data.dart';
import 'package:budget_app/data/listdata.dart';
import 'package:budget_app/widgets/chart.dart';
import 'package:flutter/material.dart';


class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day=['Day','Week','Month','Year'];
  int index_color=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text('Statics',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(4, (index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              index_color=index;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index_color==index?Colors.pinkAccent: Colors.white,
                            ),
                            alignment: Alignment.center,
                            child: Text(day[index],style: TextStyle(
                              color: index_color==index?Colors.white: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text('Expenses',style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),),
                          Icon(Icons.arrow_downward_sharp,color: Colors.grey,),

                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8)

                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Chart(),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Top Spendinds',style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                      Icon(Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,),
                    ],
                  ),
                )

              ],
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
            return ListTile(
              leading:Image.asset('assets/images/${get()[index].image!}',height: 40,) ,
              title: Text(get()[index].name!,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),),
              subtitle: Text(get()[index].time!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),),
              trailing: Text(get()[index].fee!,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),),
            );
          },
            childCount: get().length,
          ))
        ],
      ),

      ),
    );
  }
}
