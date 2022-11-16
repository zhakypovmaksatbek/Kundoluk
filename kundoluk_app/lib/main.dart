// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:kundoluk_app/colors/colors.dart';
import 'package:kundoluk_app/transaction.dart';
import 'package:kundoluk_app/widgets/password_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kundoluk',
      home: PasswordLearn(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Transaction> transaction = [
    Transaction(
        id: "t1", title: "New Shows", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2",
        title: "Weekly Groceries",
        amount: 16.99,
        date: DateTime.now()),
  ];

  // String? titleInput;
  // String? amountInput;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              // color: Color.fromARGB(255, 78, 190, 22),
              child: Text(
                "Chart",
                style: _textStyle(Colors.grey),
              ),
            ),
          ),
          Card(
              elevation: 5,
              child: Container(
                  padding: MarginsAndPaddings()._generalPadding,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          // onChanged: (value) {
                          //   titleInput = value;
                          // },
                          controller: titleController,
                          decoration: const InputDecoration(
                            label: Text("Title"),
                          ),
                        ),
                        TextField(
                          controller: amountController,
                          // onChanged: (value) {
                          //   amountInput = value;
                          // },
                          decoration: const InputDecoration(
                            label: Text("Amount"),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Add Transaction",
                              style: _textStyle(Colors.purple),
                            ))
                      ]))),
          Column(
            children: transaction.map((e) {
              return Card(
                child: Row(
                  children: [
                    Container(
                        padding: MarginsAndPaddings()._generalPadding,
                        margin: MarginsAndPaddings()._margin,
                        decoration: BoxDecoration(
                            border: _border(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          e.amount.toString() + "\$",
                          style: _textStyle(AppColors.amoutColor),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.title, style: _textStyle(AppColors.textColor)),
                        Text(
                          DateFormat.yMMMMd().format(e.date),
                          style: TextStyle(color: AppColors.dateColor),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ]),
      ),
    );
  }

  Border _border() {
    return Border.all(
      width: 2,
      color: AppColors.amoutColor,
    );
  }

  TextStyle _textStyle(Color color) {
    return TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: color);
  }
}

class MarginsAndPaddings {
  final EdgeInsets _margin =
      const EdgeInsets.symmetric(horizontal: 15, vertical: 10);
  final EdgeInsets _generalPadding = const EdgeInsets.all(5);
}
