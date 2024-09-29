import 'package:flutter/material.dart';

// Main entry point of the Flutter application
void main() {
  runApp(ChatApp());
}

// Root widget for the chat application
class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Interface',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatPage(),
    );
  }
}

// Chat Page containing the chat interface
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat '),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105)
),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Left and right padding
        child: Column(
          children: [
            // Chat Messages List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  ChatBubble(
                    text:
                        'Good morning ,I would like u ask a few question .',
                    time: '09:00',
                    isMe: false,
                  ),
                  ChatBubble(
                    text:
                        'Sure ,I am greatful.Please carry on',
                    time: '09:30',
                    isMe: true,
                  ),
                  ChatBubble(
                    text:
                        'I would like to presue cybersecurity as my career in future .',
                    time: '09:43',
                    isMe: false,
                  ),
                  ChatBubble(
                    text: "Oh ! that's' really nice .There is a lot of oppertunity .",
                    time: '09:55',
                    isMe: true,
                  ),
                ],
              ),
            ),
            // Typing Indicator with user icon
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.account_circle,
                      color: Color.fromARGB(255, 41, 10, 105),
                      size: 30.0), // Larger User account icon
                  SizedBox(width: 8.0),
                  Text('typing...'),
                ],
              ),
            ),
            // Message Input Area
            MessageInputArea(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:const Color.fromARGB(255, 41, 10, 105) ,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Chat Bubble Widget
class ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isMe;

  const ChatBubble({super.key, required this.text, required this.time, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Show account icon for the sender of the message
          if (!isMe) ...[
            const Icon(Icons.account_circle,
                color: Color.fromARGB(255, 14, 113, 64),
                size: 50.0), // Larger Doctor or receiver account icon
            const SizedBox(width: 8.0),
          ],
          // Chat message container
          Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width *
                    0.6), // Adjust chat bubble width
            decoration: BoxDecoration(
              color: isMe ? Colors.blue[100] : Colors.grey[300],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(text),
                const SizedBox(height: 5.0),
                Text(
                  time,
                  style: const TextStyle(fontSize: 10.0, color: Colors.black54),
                ),
              ],
            ),
          ),
          // Show account icon for the user of the message
          if (isMe) ...[
            const SizedBox(width: 8.0),
            const Icon(Icons.account_circle,
                color: Color.fromARGB(255, 41, 10, 105), size: 50.0), // Larger Sender account icon
          ],
        ],
      ),
    );
  }
}

// Message Input Area Widget
class MessageInputArea extends StatelessWidget {
  const MessageInputArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Write Here...',
                fillColor: Color.fromARGB(255, 41, 10, 105)
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color:  const Color.fromARGB(255, 41, 10, 105),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
