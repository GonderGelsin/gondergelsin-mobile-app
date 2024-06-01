import 'package:flutter/material.dart';

import 'package:flutter_tawk/flutter_tawk.dart';



class supportpage extends StatelessWidget {
  const supportpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gönder Gelsin Destek'),
          backgroundColor: const Color(0XFFF7931E),
          elevation: 0,
        ),
        body: Tawk(
          directChatLink: 'https://tawk.to/chat/665b2469981b6c56477731cc/1hva0cfg6'
          ,
          visitor: TawkVisitor(
            name: 'Görkem Şahin',
            email: 'gorkemsahin33@gmail.com',
          ),
          onLoad: () {
            print('Gönder Gelsin');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: Text('Yükleniyor...'),
          ),
        ),
      ),
    );
  }
}