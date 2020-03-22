import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  TextEditingController input = new TextEditingController();
   final double raduis = 8;
  Input({this.input});
  @override
  Widget build(BuildContext context) {
    return    Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(raduis))),
                height: 50,
                width: 100,
                child: TextField(
                  controller: input,
                ),
              );
  }
}