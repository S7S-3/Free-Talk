import 'package:flutter/material.dart';
import '../colors/color.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.time,
    required this.message,
    required this.isUser,
  });

  final String message;
  final bool isUser;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75, // Limits max width
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isUser ? AppColors.tealBlue : AppColors.gallery,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isUser ? AppColors.white : AppColors.tealBlue,
                  ),
                  maxLines: null,
                  softWrap: true, // Ensures the text wraps correctly
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
