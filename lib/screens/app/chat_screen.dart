import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostui/models/chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> _messages = <ChatMessage>[
    const ChatMessage(1, 'Message #1', 1, 2),
    const ChatMessage(2, 'Message #2', 1, 2),
    const ChatMessage(
        3,
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        2,
        1),
    const ChatMessage(4, 'Message #4', 2, 1),
    const ChatMessage(
        5,
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        1,
        2),
    const ChatMessage(1, 'Message #1', 1, 2),
    const ChatMessage(2, 'Message #2', 1, 2),
    const ChatMessage(
        3,
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        2,
        1),
    const ChatMessage(4, 'Message #4', 2, 1),
    const ChatMessage(
        5,
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        1,
        2),
    const ChatMessage(1, 'Message #1', 1, 2),
    const ChatMessage(2, 'Message #2', 1, 2),
    const ChatMessage(
        3,
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        2,
        1),
    const ChatMessage(4, 'Message #4', 2, 1),
    const ChatMessage(
        5,
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        1,
        2),
  ];

  late ScrollController _scrollController;
  late TextEditingController _messageTextController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _messageTextController = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: _messages.map((ChatMessage chatMessage) {
                    return Align(
                      alignment: chatMessage.senderId == 1
                          ? AlignmentDirectional.topEnd
                          : AlignmentDirectional.topStart,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsetsDirectional.only(
                            bottom: 15,
                            start: chatMessage.senderId == 1 ? 40 : 0,
                            end: chatMessage.senderId != 1 ? 40 : 0),
                        decoration: BoxDecoration(
                          color: chatMessage.senderId == 1
                              ? Colors.pink.shade200
                              : Colors.green.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: chatMessage.senderId == 1
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                          children: [
                            Text(
                              chatMessage.message,
                              style: GoogleFonts.nunito(),
                            ),
                            Text(
                              '9:32am',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.nunito(
                                color: Colors.black45,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _messageTextController,
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Enter message here...',
                    enabledBorder: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () => _performSendMessage(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performSendMessage() {
    if (_checkData()) {
      _sendMessage();
    }
  }

  bool _checkData() {
    return _messageTextController.text.isNotEmpty;
  }

  void _sendMessage() {
    setState(() {
      _messages.add(ChatMessage(1, _messageTextController.text, 1, 2));
    });
    Future.delayed(Duration(milliseconds: 100),() {
      _scrollController.position.moveTo(
        double.infinity,
        duration: Duration(milliseconds: 100),
      );
    });

    // _scrollController.position.animateTo(300,
    //     duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    // _scrollController.position.jumpTo(300);
    _messageTextController.clear();
  }
}
