import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/routes.dart';

void main() => runApp(LiveChat());

class LiveChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveSupport',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LiveSupportPage.routeName,
      routes: {
        LiveSupportPage.routeName: (context) => LiveSupportPage(),
      },
    );
  }
}

class LiveSupportPage extends StatelessWidget {
  static String routeName = '/live_support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Canlı Destek"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  bool _isTyping = false;
  bool _welcomeMessageSent = false;

  @override
  void initState() {
    super.initState();
    _addMessage(
        "Gönder Gelsine Hoşgeldiniz! Yazışmalarımız kalite standartları gereği kayıt altına alınmaktadır. Kişisel verilerinizin işlenmesine yönelik detaylı bilgi için lütfen Aydınlatma Metnimizi inceleyiniz.",
        false);
  }

  void _addMessage(String text, bool isUserMessage) {
    Timer(Duration(milliseconds: 1000 * _messages.length), () {
      setState(() {
        _messages.add(Message(text, isUserMessage));
        if (!isUserMessage && !_welcomeMessageSent) {
          _isTyping = true;
          _startTypingTimer();
          _welcomeMessageSent = true;
        }
      });
    });
  }

  void _sendMessage(String text) {
    _addMessage(text, true);
    _controller.clear();
  }

  void _startTypingTimer() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        _addMessage("Size nasıl yardımcı olabilirim?", false);
        _isTyping = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            reverse: false,
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _buildMessageBubble(_messages[index]);
            },
          ),
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Mesajınızı buraya yazın...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    _sendMessage(_controller.text);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Align(
      alignment:
          message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          message.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isUserMessage;

  Message(this.text, this.isUserMessage);
}
