import 'package:flutter/cupertino.dart';
import '../../models/message/message_model.dart';
import '../../services/firebase/chat_bot_service.dart';

class ChatBotProviders extends ChangeNotifier {
  var messageHistory = <MessageModel>[];
  var messageController = TextEditingController();
  var messageLoading = false;

  void sendMessageToBot(String message) async {
    ChatService chatService = ChatService();
    messageHistory.add(MessageModel(sender: 'user', text: message,time: DateTime.now()));
    messageController.clear();
    messageLoading = true;
    notifyListeners();
    String? botResponse = await chatService.sendMessage(message);
    messageHistory.add(MessageModel(sender: 'bot', text: botResponse??'',time: DateTime.now()));
    messageLoading = false;
    notifyListeners();
  }
  void onClearChat() {
    messageHistory.clear();
    notifyListeners();
  }
  String formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

}
