import 'package:flutter/material.dart';


class botText extends StatelessWidget {
  final String t1;
  botText(this.t1);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffF7FDFB),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 15),
                  child: Text(t1,
                    style: TextStyle(
                        color: Color(0xff303834),
                        fontWeight: FontWeight.w500
                    ),textAlign: TextAlign.start,),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
