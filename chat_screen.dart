import 'package:flutter/material.dart';
import 'dart:math';

class ChatScreen extends StatefulWidget {
  final String contactName;
  final String phoneNumber;

  ChatScreen({required this.contactName, required this.phoneNumber});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];

  // Danh sách câu trả lời ngẫu nhiên của bot
  final List<String> botResponses = [
    'Chào bạn, bạn khỏe không?',
    'Hôm nay trời đẹp quá nhỉ!',
    'Bạn đang làm gì vậy?',
    'Mình thích trò chuyện với bạn lắm!',
    'Có gì thú vị đang xảy ra không?',
    'Bạn đã ăn chưa? Mình đói rồi đây!',
    'Cuộc sống thế nào, kể mình nghe đi!',
  ];

  void _sendMessage(String text) {
    if (text.isEmpty) return;

    setState(() {
      messages.add({'text': text, 'sender': 'me'});
      _controller.clear();

      // Bot trả lời sau 1 giây
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          messages.add({
            'text': botResponses[Random().nextInt(botResponses.length)],
            'sender': 'bot',
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.contactName),
            Text(
              widget.phoneNumber,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isMe = messages[index]['sender'] == 'me';
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.teal[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(messages[index]['text']!),
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
                    decoration: const InputDecoration(
                      hintText: 'Nhập tin nhắn...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.teal),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
