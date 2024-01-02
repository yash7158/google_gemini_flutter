



import 'dart:convert';

import 'package:http/http.dart' as http;


Future<String> generateContent(String apiKey,String text) async {
  const url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';
  final response = await http.post(
    Uri.parse('$url?key=$apiKey'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "contents": [{
        "parts":[{
          "text": text
        }]
      }]
    }),
  );
  try{
      print(response.body);
      final response1 = jsonDecode(response.body);
      if (response1['promptFeedback']['blockReason'] != null) {
        return "Sorry, Unable to reponse due to ${jsonDecode(
            response.body)['promptFeedback']['blockReason']} issue";
      } else {
        return response1['candidates'][0]['content']['parts'][0]['text']
            .toString();
      }
  }catch(e) {
    return "Sorry, Failed to load data ";
    //throw Exception('Failed to load data');
  }
}
