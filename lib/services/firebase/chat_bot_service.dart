import 'package:free_talk/utils/constants/constants.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatService {
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: Constants.apikey, // Replace with your key
  );

  Future<String?> sendMessage(String userMessage) async {
    try {
      final response = await model.generateContent([Content.text(userMessage)]);
      return response.text;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
