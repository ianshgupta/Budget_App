import 'package:budget_app/data/listdetails.dart';

//! defines a function that returns a list of objects of type Money.

List<Money> get() {
  Money csb = Money();
  csb.name = 'Freelancing';
  csb.fee = '350';
  csb.time = 'Yesterday';
  csb.image = 'Transfer.png';
  csb.purchase = false;

  Money upwork = Money();
  upwork.name = 'Paytm';
  upwork.fee = '650';
  upwork.time = 'Today';
  upwork.image = 'Transfer.png';
  upwork.purchase = false;

  Money snacks = Money();
  snacks.name = 'Snacks';
  snacks.fee = '20';
  snacks.time = 'Just Now';
  snacks.image = 'food.png';
  snacks.purchase = true;

  Money clothes = Money();
  clothes.name = 'Clothes';
  clothes.fee = '1280';
  clothes.time = 'Today';
  clothes.image = 'Transportation.png';
  clothes.purchase = true;

  Money income = Money();
  income.name = 'Salary';
  income.fee = '8500';
  income.time = 'Today';
  income.image = 'Education.png';
  income.purchase = false;

  Money starbucks = Money();
  starbucks.name = 'Starbucks';
  starbucks.fee = '750';
  starbucks.time = 'Today';
  starbucks.image = 'food.png';
  starbucks.purchase = true;

  return [upwork, csb, snacks, clothes, income, starbucks];
}
