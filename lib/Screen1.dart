import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  late int first, second;
  late String opp;
  late String result, text = "";

  void btnClicked(String btnText) {
    if (btnText == "C") {
      print("case1");
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "*" ||
        btnText == "/") {
      print("case2");
      first = int.parse(text);
      result = "";
      opp = btnText;
    } else if (btnText == "=") {
      print("case3");
      second = int.parse(text);
      if (opp == "+") {
        result = (first + second).toString();
      } else if (opp == "-") {
        result = (first - second).toString();
      } else if (opp == "*") {
        result = (first * second).toString();
      } else if (opp == "/") {
        result = (first / second).toString();
      }
    } else {
      print("case 4");
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }

  customOutlineButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(value),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Text(
            value,
            style: TextStyle(fontSize: 25.sp),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Calculator',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.r),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                customOutlineButton("9"),
                customOutlineButton("8"),
                customOutlineButton("7"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("6"),
                customOutlineButton("5"),
                customOutlineButton("4"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("3"),
                customOutlineButton("2"),
                customOutlineButton("1"),
                customOutlineButton("*"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("C"),
                customOutlineButton("0"),
                customOutlineButton("="),
                customOutlineButton("*/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
