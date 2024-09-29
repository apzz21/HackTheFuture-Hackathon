import 'package:google_generative_ai/google_generative_ai.dart'; // Import the required package

class GeminiService {
  final String APIKEY = 'AIzaSyCPPLqwQu_yVMa3SLIVAklx4CodqDyXO0M';

  GeminiService();

  Future<String> generateResponse(String prompt) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: APIKEY,
      );

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      // Assuming the response contains a field called 'text' or similar
      return response.text.toString(); // Return the response as a string
    } catch (e) {
      // Handle error appropriately
      return 'Error: $e'; // Return error message as a string
    }
  }
}
