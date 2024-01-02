import 'package:flutter/material.dart';


class userText extends StatelessWidget {
  userText(this.t1);
  final String t1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff07A288),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 15),
                  child: Text(t1,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    ),textAlign: TextAlign.end,),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
