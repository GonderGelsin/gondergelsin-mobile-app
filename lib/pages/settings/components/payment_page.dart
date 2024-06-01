import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödeme Yöntemlerim'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddCardScreen(),
                ));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.add),
                  SizedBox(width: 5.0),
                  Text('Yeni Kart Ekle'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildCardItem('**** **** **** 1234', '12/24'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem(String cardNumber, String expiryDate) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.credit_card),
        title: Text(cardNumber),
        subtitle: Text('Son Kullanma Tarihi: $expiryDate'),
        onTap: () {
          // Kartı seçmek için bir işlem yapabilirsiniz
        },
      ),
    );
  }
}

class AddCardScreen extends StatelessWidget {
  void _saveCard(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Kart Ekle'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Kart Numarası',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                _CardNumberInputFormatter(),
              ],
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Son Kullanma Tarihi (MM/YY)',
                    ),
                    inputFormatters: [
                      _ExpirationDateFormatter(),
                    ],
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Güvenlik Kodu',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          3), // Güvenlik kodu maksimum 3 rakam olmalı
                      _SecurityCodeInputFormatter(),
                    ],
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _saveCard(context);
              },
              child: Text('Kartı Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text.replaceAllMapped(
      RegExp(r'(\d{4})(?=\d)'),
      (Match match) => '${match[1]} ',
    );

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class _ExpirationDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (text.length == 1 && int.parse(text) > 1) {
      text = '0$text';
    } else if (text.length == 2) {
      final month = int.parse(text);
      if (month < 1 || month > 12) {
        text = '01';
      }
    } else if (text.length == 2 && !text.contains('/')) {
      text += '/';
    } else if (text.length == 3 && text[2] != '/') {
      text = text.replaceRange(2, 3, '/${text[2]}');
    } else if (text.length > 5) {
      // İki rakamdan fazla girildiğinde, son girilen rakamları sil
      text = text.substring(0, 5);
    } else if (text.length == 5 && !text.endsWith('/')) {
      // Son kullanma tarihi 'MM/YY' formatında olmalı
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class _SecurityCodeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (text.length > 3) {
      // Daha fazla karakter girildiyse, son girilenleri sil
      text = text.substring(0, 3);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
