import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String userInitials = "LE"; // Example: Replace with user's initials
  final String doctorInitials = "DR"; // Example: Replace with doctor's initials

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatMessage> messages = [
    ChatMessage(
      message: 'Hello, Dr. John. I have a question about my medication.',
      isUser: true,
      initials: "LE",
    ),
    ChatMessage(
      message: 'Sure, what would you like to know?',
      isUser: false,
      initials: "DR",
    ),
    ChatMessage(
      message: 'Is it okay to take these pills with food?',
      isUser: true,
      initials: "LE",
    ),
    ChatMessage(
      message: 'Yes, you can take them with food.',
      isUser: false,
      initials: "DR",
    ),
  ];

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Chat with Dr. John Smith',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF5518FC),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return messages[index];
              },
            ),
          ),
          // Example input field for sending messages
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.grey, // Border color
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.blue, // Focused border color
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.grey), // Hint text color
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(
          message: messageText,
          isUser: true,
          initials: widget.userInitials,
        ));
        _messageController.clear();
      });
    }
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isUser;
  final String initials;

  const ChatMessage({
    required this.message,
    required this.isUser,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!isUser) // Doctor's profile on the left
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                child: Text(
                  initials,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Color(0xFF5518FC),
              ),
            ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: !isUser ? Color.fromARGB(255, 139, 175, 7) : Color(0xFF5518FC),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          if (isUser) // User's profile on the right
            Container(
              margin: EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                child: Text(
                  initials,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Color.fromARGB(255, 139, 175, 7),
              ),
            ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatPage(),
  ));
}
