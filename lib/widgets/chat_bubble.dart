import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:buddy_app/constants/styles.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final int id;
  const ChatBubble({Key? key, required this.text, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: smallPadding,
      margin: standardPadding,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      decoration: BoxDecoration(color: _isOdd(id) ? senderColor : recipientColor, borderRadius: standardRadius),
      child: _isOdd(id)
          ? Text(
              text.trim(),
              style: getStyle(fontSize: 14),
            )
          : AnimatedTextKit(
              animatedTexts: [TyperAnimatedText(text.trim(), textStyle: getStyle(fontSize: 14))],
              isRepeatingAnimation: false,
            ),
    );
  }

  // check if odd
  bool _isOdd(int number) {
    return number % 2 != 0;
  }
}
