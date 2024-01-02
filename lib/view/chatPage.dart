import 'package:flutter/material.dart';
import 'package:google_gemini_flutter/Modal/chatModel.dart';
import 'package:google_gemini_flutter/controller/chatItems.dart';

import '../widgets/loadingText.dart';

class chatPage extends StatefulWidget {
  chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
  Icon icon = Icon(Icons.send);
}


class _chatPageState extends State<chatPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
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
                    child: Row(
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
                        GestureDetector(
                          onTap: () async {
                            if(textEditingController.text.isNotEmpty && isLoading==false) {
                              setState(() {
                                widget.icon = Icon(Icons.send,color: Colors.grey,);
                              });
                              isLoading = true;
                              addChatUser(chatModel(
                                  textEditingController.text, "user"));
                              setState(() {});
                              await Future.delayed(
                                  const Duration(milliseconds: 250));
                              chatWidget.add(loading());
                              setState(() {});
                              await addChatBot(chatModel(
                                  textEditingController.text, "user"));
                              setState(() {
                                widget.icon = Icon(Icons.send);
                              });
                              isLoading = false;
                            }
                          },
                            child: widget.icon
                        )
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
