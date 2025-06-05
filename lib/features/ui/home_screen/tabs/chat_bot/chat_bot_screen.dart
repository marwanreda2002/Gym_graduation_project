import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final List<Map<String, String>> messages = [];
  final TextEditingController controller = TextEditingController();
  final String apiKey = "";

  Future<void> sendMessage(String message) async {
    setState(() {
      messages.add({'role': 'user', 'content': message});
    });

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          for (var msg in messages)
            {'role': msg['role'], 'content': msg['content']}
        ]
      }),
    );

    if (response.statusCode == 200) {
      final reply =
          json.decode(response.body)['choices'][0]['message']['content'];
      setState(() {
        messages.add({'role': 'assistant', 'content': reply});
      });
    } else {
      setState(() {
        messages.add({
          'role': 'assistant',
          'content':
              'Error: Unable to get response. Check API key or usage limit.'
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Chatbot')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (_, index) {
                final msg = messages[index];
                final isUser = msg['role'] == 'user';
                return ListTile(
                  title: Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        msg['content'] ?? '',
                        style: TextStyle(
                            color: isUser ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final text = controller.text;
                    if (text.isNotEmpty) {
                      sendMessage(text);
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:intl/intl.dart';
//
// class ChatBotScreen extends StatefulWidget {
//   const ChatBotScreen({super.key});
//   @override
//   State<ChatBotScreen> createState() => _ChatBotScreenState();
// }
// class _ChatBotScreenState extends State<ChatBotScreen> {
//   final TextEditingController _userInput =TextEditingController();
//   static const apiKey = "AIzaSyDv1iR-vrRZrwTggS4idRwfW5iRPkwfVQc";
//   // final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//   final List<Message> _messages = [];
//
//   Future<void> sendMessage() async{
//     final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//     final message = "hello";
//     // setState(() {
//     //   _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
//     // });
//     final content = Content.text(message);
//     final response = await model.generateContent([content]);
//     // setState(() {
//     //   _messages.add(Message(isUser: false, message: response.text?? "", date: DateTime.now()));
//     // });
//     print("response ISA ysht8l: $response");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
//                 image: NetworkImage('https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEigDbiBM6I5Fx1Jbz-hj_mqL_KtAPlv9UsQwpthZIfFLjL-hvCmst09I-RbQsbVt5Z0QzYI_Xj1l8vkS8JrP6eUlgK89GJzbb_P-BwLhVP13PalBm8ga1hbW5pVx8bswNWCjqZj2XxTFvwQ__u4ytDKvfFi5I2W9MDtH3wFXxww19EVYkN8IzIDJLh_aw/s1920/space-soldier-ai-wallpaper-4k.webp'),
//                 fit: BoxFit.cover
//             )
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//                 child: ListView.builder(itemCount:_messages.length,itemBuilder: (context,index){
//                   final message = _messages[index];
//                   return Messages(isUser: message.isUser, message: message.message, date: DateFormat('HH:mm').format(message.date));
//                 })
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 15,
//                     child: TextFormField(
//                       style: TextStyle(color: Colors.white),
//                       controller: _userInput,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           label: Text('Enter Your Message')
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   IconButton(
//                       padding: EdgeInsets.all(12),
//                       iconSize: 30,
//                       style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(Colors.black),
//                           foregroundColor: MaterialStateProperty.all(Colors.white),
//                           shape: MaterialStateProperty.all(CircleBorder())
//                       ),
//                       onPressed: (){
//                         sendMessage();
//                       },
//                       icon: Icon(Icons.send))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// class Message{
//   final bool isUser;
//   final String message;
//   final DateTime date;
//   Message({ required this.isUser, required this.message, required this.date});
// }
// class Messages extends StatelessWidget {
//   final bool isUser;
//   final String message;
//   final String date;
//   const Messages(
//       {
//         super.key,
//         required this.isUser,
//         required this.message,
//         required this.date
//       });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(15),
//       margin: EdgeInsets.symmetric(vertical: 15).copyWith(
//           left: isUser ? 100:10,
//           right: isUser ? 10: 100
//       ),
//       decoration: BoxDecoration(
//           color: isUser ? Colors.blueAccent : Colors.grey.shade400,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10),
//               bottomLeft: isUser ? Radius.circular(10): Radius.zero,
//               topRight: Radius.circular(10),
//               bottomRight: isUser ? Radius.zero : Radius.circular(10)
//           )
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             message,
//             style: TextStyle(fontSize: 16,color: isUser ? Colors.white: Colors.black),
//           ),
//           Text(
//             date,
//             style: TextStyle(fontSize: 10,color: isUser ? Colors.white: Colors.black,),
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
// import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
// import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
//
// class ChatBotScreen extends StatelessWidget {
//   const ChatBotScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: CustomBackButtonCircle(),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 21.h),
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Colors.white, AppColors.primaryColor])),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               ShaderMask(
//                   blendMode: BlendMode.srcIn,
//                   shaderCallback: (Rect bounds) => LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Color(0xff378CE7),
//                           Color(0xff060606),
//                         ],
//                       ).createShader(bounds),
//                   child: Text(
//                     "Hi",
//                     style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w400, fontSize: 36.sp),
//                   )),
//               ShaderMask(
//                   blendMode: BlendMode.srcIn,
//                   shaderCallback: (Rect bounds) => LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [
//                           Color(0xff378CE7),
//                           Color(0xff000000),
//                           Color(0xff000000),
//                         ],
//                       ).createShader(bounds),
//                   child: Text(
//                     "Mohamed",
//                     style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w800, fontSize: 36.sp),
//                   )),
//               SizedBox(
//                 height: 90.h,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                     Color(0xff378CE7),
//                     Color(0xff000000),
//                   ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//                   borderRadius: BorderRadius.circular(7.r),
//                 ),
//                 child: Container(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.w),
//                   margin: EdgeInsets.all(1),
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.white,
//                             Color(0xff90BAE8),
//                           ]),
//                       borderRadius: BorderRadius.circular(7.r)),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 20.0.h,
//                         ),
//                         child: Text(
//                           textAlign: TextAlign.center,
//                           "How can AI help me improve my workouts?",
//                           style: AppStyles.regular16black,
//                         ),
//                       ),
//                       Divider(
//                         color: Color(0x994c4c4c),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 16.0.h,
//                         ),
//                         child: Text(
//                           textAlign: TextAlign.center,
//                           "What kind of data does the AI need to personalize my fitness plan?",
//                           style: AppStyles.regular16black,
//                         ),
//                       ),
//                       Divider(
//                         color: Color(0x994c4c4c),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 16.0.h,
//                         ),
//                         child: Text(
//                           textAlign: TextAlign.center,
//                           "Can the AI suggest nutrition plans based on my fitness goals?",
//                           style: AppStyles.regular16black,
//                         ),
//                       ),
//                       Divider(
//                         color: Color(0x994c4c4c),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: 16.0.h,
//                         ),
//                         child: Text(
//                           textAlign: TextAlign.center,
//                           "How does the AI ensure my workouts are safe and effective?",
//                           style: AppStyles.regular16black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 180.h,
//               ),
//               // Spacer(),
//               Row(
//                 children: [
//                   ImageIcon(
//                     AssetImage("assets/images/upload_image_icon.png"),
//                     color: Color(0xff727272),
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   Expanded(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Color(0x7affffff),
//                           hintText: "Enter your message.... ",
//                           hintStyle: AppStyles.regular15grey
//                               .copyWith(color: Color(0xff6F6F6F)),
//                           suffixIcon: Icon(
//                             Icons.send_outlined,
//                             color: Color(0xff727272),
//                           ),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(28.5.r),
//                               borderSide: BorderSide.none)),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
