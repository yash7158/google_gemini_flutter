import 'dart:io';

import 'package:flutter/material.dart';

class imageContainer extends StatelessWidget {
  imageContainer(this.file,this.f1);
  late File file;
  late VoidCallback f1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(file)),
            ),
          ),
          GestureDetector(
            onTap: f1,
              child: CircleAvatar(child: Icon(Icons.close,color: Colors.white,size: 15,),backgroundColor: Colors.black,radius: 10,)),
        ],
      ),
    );
  }
}

class imageContainerChat extends StatelessWidget {
  imageContainerChat(this.file);
  late File file;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(file)),
          ),
        ),
      ],
    );
  }
}



