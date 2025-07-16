import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController controller = TextEditingController();
  final List<Map<String, String>> messages = [];
  static const String _apiKey = 'AIzaSyDv1iR-vrRZrwTggS4idRwfW5iRPkwfVQc';
  late final GenerativeModel _model;
  late final ChatSession _chat;

  final List<String> predefinedQuestions = [
    "How can AI help me improve my workouts?",
    "What kind of data does the AI need to personalize my fitness plan?",
    "Can the AI suggest nutrition plans based on my fitness goals?",
    "How does the AI ensure my workouts are safe and effective?"
  ];

  bool hasInteracted = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: _apiKey);
    _chat = _model.startChat();
  }

  Future<void> sendMessage(String input) async {
    if (input.trim().isEmpty) return;

    setState(() {
      hasInteracted = true;
      messages.add({'role': 'user', 'content': input});
    });

    controller.clear();

    try {
      final userContent = Content.text(input);
      final response = await _chat.sendMessage(userContent);

      final text = response.text;
      if (text != null && text.trim().isNotEmpty) {
        setState(() {
          messages.add({'role': 'bot', 'content': text.trim()});
        });
      }
    } catch (e) {
      setState(() {
        messages.add({'role': 'bot', 'content': '⚠️ Error: $e'});
      });
    }
  }

  Widget buildPredefinedQuestion(String question) {
    return InkWell(
      onTap: () => sendMessage(question),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(
          question,
          textAlign: TextAlign.center,
          style: AppStyles.regular16black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButtonCircle(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 21.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, AppColors.primaryColor],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!hasInteracted) ...[
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff378CE7), Color(0xff060606)],
                ).createShader(bounds),
                child: Text(
                  "Hi",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 36.sp,
                  ),
                ),
              ),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff378CE7),
                    Color(0xff000000),
                    Color(0xff000000)
                  ],
                ).createShader(bounds),
                child: Text(
                  "Mohamed",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 36.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff378CE7), Color(0xff000000)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.w),
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Color(0xff90BAE8)],
                    ),
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Column(
                    children: predefinedQuestions
                        .map((question) => Column(
                              children: [
                                buildPredefinedQuestion(question),
                                if (question != predefinedQuestions.last)
                                  Divider(color: Color(0x994c4c4c)),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final isUser = msg['role'] == 'user';
                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: isUser ? Color(0xff378CE7) : Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        msg['content'] ?? '',
                        style: AppStyles.regular16black.copyWith(
                            color: isUser ? Colors.white : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                ImageIcon(
                  AssetImage("assets/images/upload_image_icon.png"),
                  color: Color(0xff727272),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    onFieldSubmitted: sendMessage,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0x7affffff),
                      hintText: "Enter your message.... ",
                      hintStyle: AppStyles.regular15grey
                          .copyWith(color: Color(0xff6F6F6F)),
                      suffixIcon: IconButton(
                        icon:
                            Icon(Icons.send_outlined, color: Color(0xff727272)),
                        onPressed: () => sendMessage(controller.text),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.5.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
