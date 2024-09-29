
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:htfnew/models/gemini_model.dart'; // Import your service file

class ChatPageG extends StatefulWidget {
  const ChatPageG({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPageG> {
  final TextEditingController _controller = TextEditingController();
  final GeminiService geminiService = GeminiService(); // No API key needed here
  final List<Map<String, String>> _messages = []; // List to store chat messages

  Future<void> _sendMessage() async {
    String prompt = _controller.text;
    if (prompt.isNotEmpty) {
      setState(() {
        _messages.add({"role": "user", "text": prompt}); // Add user message
      });

      // Clear the input field
      _controller.clear();

      // Get the response from the Gemini service
      String responseText = await geminiService.generateResponse(prompt);

      setState(() {
        _messages
            .add({"role": "bot", "text": responseText}); // Add bot response
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with pengAI'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105)
),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Ensures the newest messages appear at the bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length -
                    1 -
                    index]; // Access messages in reverse order
                final isUser = message["role"] == "user";

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ?const Color.fromARGB(255, 41, 10, 105): Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MarkdownBody(
                      data: message["text"] ?? '',
                      styleSheet: MarkdownStyleSheet(
                        p: TextStyle(
                            color: isUser ? Colors.white : const Color.fromARGB(255, 41, 10, 105)),
                      ),
                    ),
                    /*
                    child: Text(
                      message["text"] ?? '',
                      style: TextStyle(
                          color: isUser ? Colors.white : Colors.black),
                    ),
                    */
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Type your message',fillColor: Color.fromARGB(255, 41, 10, 105) ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send,color:  Color.fromARGB(255, 41, 10, 105),),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
