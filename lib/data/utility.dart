import 'package:budget_app/data/model/add_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

int totals=0;
var history2=box.values.toList();
final box=Hive.box<Add_data>('add');
int total(){

  List a=[0,0];
  for(var i=0;i<history2.length;i++){
    a.add(history2[i].IN=='Income'
        ?int.parse(history2[i].amount)
        :int.parse(history2[i].amount)*-1);
  }
  totals=a.reduce((value, element) => value+element);
  return totals;
}
int income(){
  var history2=box.values.toList();
  List a=[0,0];
  for(var i=0;i<history2.length;i++){
    a.add(history2[i].IN=='Income'
        ?int.parse(history2[i].amount)
        :0);
  }
  totals=a.reduce((value, element) => value+element);
  return totals;
}
int expenses(){
  var history2=box.values.toList();
  List a=[0,0];
  for(var i=0;i<history2.length;i++){
    a.add(history2[i].IN=='Income'
        ?0
        :int.parse(history2[i].amount)*-1);
  }
  totals=a.reduce((value, element) => value+element);
  return totals;
}
// List<Add_data> today(){
//   List<Add_data> a=[];
//   DateTime date=new DateTime.now();
//   for(var i=0;i<history2.length;i++){
//    if(history2[i].datetime.day==date.day){
//      a.add(history2[i]);
//    }
//    return a;
//   }
// }