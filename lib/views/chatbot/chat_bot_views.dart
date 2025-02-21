import 'package:flutter/material.dart';
import 'package:free_talk/utils/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../providers/chatbot/chat_bot_providers.dart';
import '../../utils/colors/color.dart';
import '../../utils/widgets/message_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class ChatBotViews extends StatelessWidget {
  const ChatBotViews({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChatBotProviders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          'Chat Bot',
          style: TextStyle(
              color: AppColors.tealBlue,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.tealBlue,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                provider.onClearChat();
              },
              icon: const Icon(
                Icons.cleaning_services_outlined,
                color: AppColors.tealBlue,
              ))
        ],
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>MessageItem(
                          time: provider.formatTime(provider.messageHistory[index].time),
                          message:provider.messageHistory[index].text,
                          isUser: provider.messageHistory[index].sender == 'user',
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: provider.messageHistory.length),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: provider.messageController,
                cursorColor: AppColors.tealBlue,
                decoration: InputDecoration(
                  hintText: "Send a message",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        provider
                            .sendMessageToBot(provider.messageController.text);
                      },
                      icon: const Icon(Icons.send, size: 24),
                      color: AppColors.gallery,
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.tealBlue),
                        elevation: WidgetStatePropertyAll(1),
                      ),
                    ),
                  ),
                  fillColor: AppColors.gallery,
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: const BorderSide(
                      color: AppColors.tealBlue,
                      width: 3,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: const BorderSide(
                      color: AppColors.tealBlue,
                      width: 3,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: const BorderSide(
                      color: AppColors.tealBlue,
                      width: 3,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: const BorderSide(
                      color: AppColors.tealBlue,
                      width: 3,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                  ),
                  counterStyle: const TextStyle(
                    color: AppColors.tealBlue,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
