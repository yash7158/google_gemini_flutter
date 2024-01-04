


import 'package:flutter/material.dart';
import 'package:google_gemini_flutter/api.dart';
import 'package:google_gemini_flutter/controller/google_gemini.dart';
import 'package:google_gemini_flutter/widgets/userText.dart';

import '../Modal/chatModel.dart';
import '../widgets/botText.dart';

List<chatModel> chat = [];
List chatData = [];
List<Widget> chatWidget  =[Image(image: AssetImage("assets/Google-Gemini-Logo-758x473-removebg-preview.png"),),];
bool isLoading  = false;


void addChatUser(chatModel chatItem){
  chat.add(chatItem);
  chatData.add(createContentEntry(chatItem.type, chatItem.text));
  updateChatWidget();
}

Future<void> addChatBot(chatModel chatItem)async {

  //implement google gemini
  final res = await generateContentChat(googleApi,chatData);

  chat.add(chatModel(res, "model"));
  chatData.add(createContentEntry("model", res));
  print(chatData);
  updateChatWidget();
}

void updateChatWidget(){
  chatWidget = [Image(image: AssetImage("assets/Google-Gemini-Logo-758x473-removebg-preview.png"),),SizedBox(height: 20,)];
  for(int i = 0;i<chat.length;i++){
    if(chat[i].type=="user"){
      chatWidget.add(userText(chat[i].text));
    }else{
      chatWidget.add(botText(chat[i].text));
    }
    chatWidget.add(SizedBox(height: 20,));
  }
}

