
import 'package:flutter/material.dart';
import 'package:htfnew/models/gemini_model.dart';

class GenAi extends StatefulWidget {
  const GenAi({super.key});

  @override
  _GenAiState createState() => _GenAiState();
}

class _GenAiState extends State<GenAi> {
  final GeminiService geminiService = GeminiService();
  final TextEditingController inputController = TextEditingController();
  final TextEditingController themeController =
      TextEditingController(); // Theme controller

  String? response;

  void handleSubmit() async {
    String themeInput = themeController.text;

    // Check if both fields are filled
    if (themeInput.isNotEmpty) {
      setState(() {
        response = 'Generating recommendations...';
      });

      try {
        // Use userInput directly as the title
        String prompt =
            'Give me the best suggestion on youtube videos $themeInput to learn';
        String generatedResponse = await geminiService.generateResponse(prompt);

        String summary = await geminiService.generateResponse(
            'Generate a brief summary of the following: $generatedResponse');

        // Update the state to display the response
        setState(() {
          response = summary;
        });
      } catch (e) {
        setState(() {
          response = 'An error occurred: $e';
        });
      }
    } else {
      // Show error if any text field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter theme')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Generate Courses'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105)

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Welcome to GoLearn. Your learning is on check with us, bringing the better in you.',
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 41, 10, 105)),
              ),
              const SizedBox(height: 20),

              // Prompt for text input
              const Text(
                'Course Generator pengAI:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Text Field for user input (video title)

              const SizedBox(height: 10),

              // Text Field for theme input
              TextField(
                controller: themeController,
                decoration: const InputDecoration(
                  hintText: 'Enter Theme',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // "Enter" Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: handleSubmit,
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 41, 10, 105),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Get Recommendations'),
                ),
              ),

              const SizedBox(height: 20),

              // Display the response here
              if (response != null)
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      children: _parseResponse(response!),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to parse the response into TextSpan
    List<TextSpan> _parseResponse(String response) {
  final List<TextSpan> spans = [];
  final RegExp boldRegex = RegExp(r'\*\*(.*?)\*\*'); // Regex for bold text surrounded by **

  // Split response based on bold regex matches
  int lastIndex = 0; // Keep track of the last index processed
  final matches = boldRegex.allMatches(response);

  for (final match in matches) {
    // Add normal text before the bold match
    if (match.start > lastIndex) {
      spans.add(TextSpan(text: response.substring(lastIndex, match.start)));
    }

    // Add the bold text
    spans.add(TextSpan(
      text: match.group(1), // Get the text between the ** **
      style: const TextStyle(fontWeight: FontWeight.bold),
    ));

    // Update last index
    lastIndex = match.end;
  }

  // Add remaining text after the last bold match, if any
  if (lastIndex < response.length) {
    spans.add(TextSpan(text: response.substring(lastIndex)));
  }

  return spans;
}

}