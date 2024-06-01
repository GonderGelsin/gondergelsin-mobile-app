import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';

class LiveSupportPage extends StatelessWidget {
  static String routeName = '/live_support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Live Support'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/665b0a3f9a809f19fb37aad9/1hv9q01v7',
        visitor: TawkVisitor(
          name: 'Zortingen',
          email: 'Emregurses06@gmail.com',
        ),
        onLoad: () {
          print('Tawk.to loaded!');
        },
        onLinkTap: (String url) {
          print(url);
        },
        placeholder: Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}
