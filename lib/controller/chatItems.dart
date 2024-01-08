


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_gemini_flutter/api.dart';
import 'package:google_gemini_flutter/controller/google_gemini.dart';
import 'package:google_gemini_flutter/controller/image.dart';
import 'package:google_gemini_flutter/widgets/imageContainer.dart';
import 'package:google_gemini_flutter/widgets/userText.dart';

import '../Modal/chatModel.dart';
import '../widgets/botText.dart';

List<chatModel> chat = [];
List chatData = [];
List<Widget> chatWidget  =[Image(image: AssetImage("assets/Google-Gemini-Logo-758x473-removebg-preview.png"),),];
bool isLoading  = false;
bool isImage = false;
var c1img;
List<Widget> imgUserText= [];

void addChatUser(chatModel chatItem){
  chat.add(chatItem);
  chatData.add(createContentEntry(chatItem.role, chatItem.text));
  updateChatWidget();
}

Future<void> addChatBot(chatModel chatItem,String type)async {

  //implement google gemini
  if(type=="text") {
    final res = await generateContentChat(googleApi, chatData);
    chat.add(chatModel(res, "model"));
    chatData.add(createContentEntry("model", res));
  }else if(type=="img"){
    final res = await generateContentImage(googleApi, chatItem.text, chatItem.base64);
    chat.add(chatModel(res, "model"));
    chatData.add(createContentEntry("model", res));
  }
  print(chatData);
  updateChatWidget();
}
Future<chatModel?> imageChat(String text,var img) async {
  if(img!=null) {
    chatModel c1 = chatModel(text, "user");
    c1.type = "img";
    c1.imagePath =img;
    c1.base64 = await convertImageFileToBase64String(File(c1.imagePath));
    return c1;
  }


}

void updateChatWidget(){
  chatWidget = [Image(image: AssetImage("assets/Google-Gemini-Logo-758x473-removebg-preview.png"),),SizedBox(height: 20,)];
  for(int i = 0;i<chat.length;i++){
    if(chat[i].role=="user"){
      if(chat[i].type=="img"){
        chatWidget.add(imageContainerChat(File(chat[i].imagePath)));
        chatWidget.add(SizedBox(height: 20,));
      }
      chatWidget.add(userText(chat[i].text));
    }else if(chat[i].role=="model"){
      chatWidget.add(botText(chat[i].text));
    }
    chatWidget.add(SizedBox(height: 20,));
  }
}

