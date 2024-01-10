import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_gemini_flutter/Modal/chatModel.dart';
import 'package:google_gemini_flutter/controller/chatItems.dart';
import 'package:google_gemini_flutter/controller/google_gemini.dart';
import 'package:google_gemini_flutter/controller/image.dart';
import 'package:google_gemini_flutter/widgets/imageContainer.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/loadingText.dart';

// ignore: must_be_immutable
class chatPage extends StatefulWidget {
  chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
  Icon iconSend = Icon(Icons.send);
}


class _chatPageState extends State<chatPage> {
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    @override
    void cancelImage(){
      isImage  =false;
      c1img=null;
      imgUserText = [];
      setState(() {
      });
    }
    Future<void> updateChat({chatModel? c1}) async{
      if(textEditingController.text.isNotEmpty && isLoading==false) {
        setState(() {
          widget.iconSend = Icon(Icons.send,color: Colors.grey,);
        });
        isLoading = true;
        if(!isImage) {
          addChatUser(chatModel(
              textEditingController.text, "user"));
          setState(() {});
          await Future.delayed(
              const Duration(milliseconds: 250));
          chatWidget.add(loading());
          setState(() {});
          await addChatBot(chatModel(
              textEditingController.text, "user"),
          "text");
        }else{
          c1img.text = textEditingController.text;
          chat.add(c1img);
          chatData.add(createContentEntry(c1img.role, c1img.text));
          imgUserText = [];
          updateChatWidget();
          setState(() {
          });
          if(c1img!=null) {
            await Future.delayed(
                const Duration(milliseconds: 250));
            chatWidget.add(loading());
            //imgUserText = [];
            setState(() {});
            await addChatBot(c1img, "img");
            setState(() {
            });
          }
        }
        setState(() {
          widget.iconSend = Icon(Icons.send);
        });
        isLoading = false;
        isImage = false;
      }
    }
    return Scaffold(
      backgroundColor: Color(0xffEAF2E9),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView(
                      padding:EdgeInsets.only(top: 10,bottom: 10),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: chatWidget,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF7FDFB),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: imgUserText+[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: TextField(
                              controller: textEditingController,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: "What should be explore today?"),
                            )),
                            SizedBox(width: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      final img = await pickImage(ImageSource.gallery);
                                      print(isImage);
                                      c1img = await imageChat("",img);
                                      if(c1img!=null) {
                                        imgUserText.add(imageContainer(
                                            File(c1img.imagePath), cancelImage));
                                        setState(() {});
                                      }
                                      },
                                    child: Icon(Icons.add)
                                ),
                                SizedBox(width: 10,),
                                GestureDetector(
                                    onTap: () async {
                                      final img = await pickImage(ImageSource.camera);
                                      print(isImage);
                                      c1img = await imageChat("",img);
                                      if(c1img!=null) {
                                        imgUserText.add(imageContainer(
                                            File(c1img.imagePath), cancelImage));
                                        setState(() {});
                                      }
                                    },
                                    child: Icon(Icons.camera_alt_rounded)
                                ),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: updateChat,
                                    child: widget.iconSend
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
