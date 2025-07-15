import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../controllers/login_controller.dart';

void main() {
  runApp(ChatbotApp());
}

class ChatbotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatbotScreen(),
    );
  }
}

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  bool _isLoading = false;

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _isLoading = true;
      _messages.add(Message(text: text, isUser: true));
    });

    _controller.clear();

    try {
      final response = await http.post(
        Uri.parse(
            'http://10.0.2.2:5000/api/chat'), // Replace with your actual API endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'input_value': text}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          _messages.add(Message(text: responseData['output'], isUser: false));
        });
      } else {
        setState(() {
          _messages.add(
              Message(text: 'Error: ${response.statusCode}', isUser: false));
        });
      }
    } catch (e) {
      setState(() {
        _messages.add(Message(text: 'Error: $e', isUser: false));
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildMessage(Message message) {
    final bool isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        decoration: BoxDecoration(
          // gradient: const LinearGradient(
          //   colors: [Color(0xFF0974f1), Color(0xFF9fccfa)],
          // ),
          color: const Color.fromARGB(255, 169, 215, 253),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF210cae), Color(0xFFf5ab2f7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        title: const Text(
          'Scheme Assist',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 4.0,
        // backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Get.defaultDialog(
                title: "Logout",
                middleText: "Are you sure you want to logout?",
                textCancel: "Cancel",
                textConfirm: "Logout",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  // final loginController = Get.find<LoginController>();
                  final LoginController loginController =
                      Get.put(LoginController());

                  loginController.logout(); // Call the logout function
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images.png',
            height: screenHeight * 0.90,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3.0, sigmaY: 3.0), // Adjust blur intensity
              child: Container(
                color: Colors.black.withOpacity(
                    0.1), // Optional overlay for better readability
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),

          // Chat UI
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _buildMessage(_messages[index]);
                    },
                  ),
                ),
                const Divider(height: 1.0),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(0.8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Type your message...',
                          ),
                          onSubmitted: (value) => _sendMessage(),
                        ),
                      ),
                      IconButton(
                        icon: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2.0),
                              )
                            : const Icon(Icons.send),
                        onPressed: _isLoading ? null : _sendMessage,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}
