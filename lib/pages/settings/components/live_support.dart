import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/services/authentication.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';

class LiveSupportPage extends StatelessWidget {
  static String routeName = '/live_support';
  final name =  getStoredData("full_name");
  final email = getStoredData("email");

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
          name:  name.toString(),
          email:  email.toString(),
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
