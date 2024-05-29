import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/size_config.dart';

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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
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
                    return Container(
                      child: ListTile(
                        title: Text('Hakkımızda'),
                      ),
                    );
                  },
                  body: Container(
                    height: getProportionateScreenHeight(200),
                    child: SingleChildScrollView(
                      child: ListTile(
                        title: Text(
                          'Gönder Gelsin olarak, günümüzün hızlı ve yoğun temposuna ayak uydurmanız için burada bulunuyoruz. '
                          'Bireysel kullanıcılar ve kurumsal firmalar için acil olarak gönderilmesi gereken ürünleri hızlı ve '
                          'güvenilir bir şekilde alıcıya ulaştırma ihtiyacını karşılamak amacıyla yola çıktık. '
                          'Mevcut kurye hizmetlerinin yetersiz kaldığı, gecikmeler yaşandığı ve güvenilirlik sorunlarının '
                          'ortaya çıktığı durumlarda, Gönder Gelsin tam kapınızda!\n\n'
                          'Gönder Gelsin, zaman yönetimi ve trafikle başa çıkma konusunda size yardımcı olacak bir kurye hizmeti '
                          'sunarak zamanınızı etkili bir şekilde kullanmanıza yardımcı olur. Bu sayede hem müşteri memnuniyetini '
                          'artırır hem de iş süreçlerini optimize eder. Dükkanlar ve işletmelerin sürekli olarak müşterilerinin '
                          'ihtiyaçlarına hızlı ve güvenilir bir şekilde cevap verme zorunluluğunu göz önünde bulundurarak, tam '
                          'zamanlı kurye personeli istihdam etmenin zaman ve maliyet açısından zorluklarını ortadan kaldırıyoruz.\n\n'
                          'Gönder Gelsin uygulamamız, sadece kurumsal firmalar için değil, ihtiyaç duyduğunuz her an herkesin '
                          'kullanımına açıktır. Amacımız, her bireye ulaşarak teknolojik gelişmeler aracılığı ile konforlu bir '
                          'hayat sunmaktır. Uygulamamızı indirdikten sonra, belli sınırlar dahilinde göndermek istediğiniz teslimatı '
                          'belirleyip, hizmetimizden kolayca yararlanabilirsiniz.\n\n'
                          'Gönder Gelsin ile gönderileriniz artık güvende, hızlı ve sorunsuz bir şekilde alıcısına ulaşıyor. '
                          'Bizi tercih ettiğiniz için teşekkür ederiz!',
                        ),
                      ),
                    ),
                  ),
                  isExpanded: _isExpanded2,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Sıkça Sorulan Sorular'),
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
                                title: Text('Nasıl sipariş oluşturabilirim?'),
                              );
                            },
                            body: Container(
                              height: getProportionateScreenHeight(200),
                              child: SingleChildScrollView(
                                child: ListTile(
                                  title: Text(
                                      'Gönder Gelsin uygulaması üzerinden sipariş oluşturmak oldukça basittir. '
                                      'İlk olarak, Gönder Gelsin uygulamasını açın ve hesabınıza giriş yapın. '
                                      'Ana ekranda, alt menüde bulunan "+" butonuna tıklayarak sipariş oluşturma ekranına geçiş yapabilirsiniz.\n\n'
                                      'Sipariş oluşturma ekranında, öncelikle gönderinizin alınacağı ve teslim edileceği adresleri girmeniz gerekmektedir. '
                                      'Adres detaylarını doğru ve eksiksiz bir şekilde doldurmanız önemlidir. '
                                      'Ardından, gönderiniz için uygun olan araç tipini seçin. '
                                      'Gönderinizin boyutu ve aciliyetine göre motosiklet, araba veya kamyonet gibi seçenekler arasından en uygun olanı tercih edebilirsiniz.\n\n'
                                      'Bir sonraki adımda, gönderinizin içeriğini açıklayan bir not yazmanız gerekmektedir. '
                                      'Bu not, kuryenin gönderiniz hakkında önemli bilgilere sahip olmasını sağlar. '
                                      'Örneğin, kırılabilir veya soğuk zincir gibi özel durumları belirtmeniz gerekebilir.\n\n'
                                      'Son olarak, ödeme yönteminizi seçin. '
                                      'Kredi kartı, banka kartı veya diğer desteklenen ödeme yöntemleri arasından size en uygun olanını tercih edebilirsiniz. '
                                      'Tüm bilgileri doğru girdiğinizden emin olduktan sonra, "Siparişi Onayla" butonuna tıklayarak siparişinizi tamamlayabilirsiniz.\n\n'
                                      'Siparişiniz onaylandıktan sonra, kuryenizin nerede olduğunu ve gönderinizin ne zaman teslim edileceğini uygulama üzerinden kolayca takip edebilirsiniz. '
                                      'Gönder Gelsin ile gönderileriniz hızlı, güvenli ve sorunsuz bir şekilde alıcısına ulaşır.\n\n'
                                      'Bizi tercih ettiğiniz için teşekkür ederiz!'),
                                ),
                              ),
                            ),
                            isExpanded: _isExpanded1_1,
                          ),
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title:
                                    Text('Ödeme yöntemini nasıl seçebilirim?'),
                              );
                            },
                            body: ListTile(
                              title: Text(
                                  'Gönderi oluştur sayfasından veya ayarlar sayfasındaki ödeme yöntemlerim kısmından size uygun olan ödeme yöntemini seçebilirsiniz.'),
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
                  body: Container(
                    height: getProportionateScreenHeight(200),
                    child: SingleChildScrollView(
                      child: ListTile(
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
                    ),
                  ),
                  isExpanded: _isExpanded3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
