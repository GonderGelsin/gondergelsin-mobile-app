import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HelpPage(),
  ));
}

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded1_1 = false;
  bool _isExpanded1_2 = false;
  bool _isExpanded3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yardım'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                if (index == 1) {
                  _isExpanded1 = !_isExpanded1;
                } else if (index == 0) {
                  _isExpanded2 = !_isExpanded2;
                } else if (index == 2) {
                  _isExpanded3 = !_isExpanded3;
                }
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text('Hakkımızda'),
                  );
                },
                body: ListTile(
                  title: Text(
                      'Bülent Ecevit Üniversitesi öğrencileri olarak öğrenim görmekteyiz ve sizler için verdiğimiz hizmetlerle işinizi kolaylaştırmaktayız.'),
                ),
                isExpanded: _isExpanded2,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text('Sıkça sorulan Sorular'),
                  );
                },
                body: Column(
                  children: [
                    ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          if (index == 0) {
                            _isExpanded1_1 = !_isExpanded1_1;
                          } else if (index == 1) {
                            _isExpanded1_2 = !_isExpanded1_2;
                          }
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text('Nasıl sipariş oluşturabilirim ?'),
                            );
                          },
                          body: ListTile(
                            title: Text(
                                'Gönder gelsin uygulamamıza giriş yaptıktan sonra alt tarafta bulunan + butonuna tıklayarak istediğiniz araç tipini seçerek sipariş verebilirsinz.'),
                          ),
                          isExpanded: _isExpanded1_1,
                        ),
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title:
                                  Text('Ödeme yöntemini nasıl seçebilirim ?'),
                            );
                          },
                          body: ListTile(
                            title: Text(
                                'Gönderi oluştur sayfasından veya ayarlar sayfasındaki ödeme yöntemlerim kısmından size uygun olan ödeme yöntemini seçebilirsiniz. '),
                          ),
                          isExpanded: _isExpanded1_2,
                        ),
                      ],
                    ),
                  ],
                ),
                isExpanded: _isExpanded1,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                        'Müşteri Kişisel Verilerinin Korunması Politikası'),
                  );
                },
                body: ListTile(
                  title: Text(
                    'Amaç\n\n'
                    'Kişisel Verileri Saklama ve İmha Politikası (“Politika”), Kişisel Verileri Koruma '
                    'Kurumunca (“Kurum”) gerçekleştirilmekte olan saklama ve imha faaliyetlerine ilişkin iş ve '
                    'işlemler konusunda usul ve esasları belirlemek amacıyla hazırlanmıştır.\n\n'
                    'Kurum; Stratejik Planda belirlenen misyon, vizyon ve temel ilkeler doğrultusunda; Kurum '
                    'çalışanları, çalışan adayları, hizmet sağlayıcıları, ziyaretçiler ve diğer üçüncü kişilere ait '
                    'kişisel verilerin T.C. Anayasası, uluslararası sözleşmeler, 6698 sayılı Kişisel Verilerin '
                    'Korunması Kanunu (“Kanun”) ve diğer ilgili mevzuata uygun olarak işlenmesini ve ilgili '
                    'kişilerin haklarını etkin bir şekilde kullanmasının sağlanmasını öncelik olarak belirlemiştir.\n\n'
                    'Kişisel verilerin saklanması ve imhasına ilişkin iş ve işlemler, Kurum tarafından bu '
                    'doğrultuda hazırlanmış olan Politikaya uygun olarak gerçekleştirilir.',
                  ),
                ),
                isExpanded: _isExpanded3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
