import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/components/notif_screen.dart';
import 'package:flutter_application_1/pages/home/components/profile_screen.dart'; // Profil sayfası import edildi

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Anasayfa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.1,
                    ),
                  ),
                ),
                SizedBox(width: 110),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _navigateToNotificationPage(
                          context); // Bildirim sayfasına yönlendirme işlevi çağrıldı
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Image.asset(
                        'assets/images/notification.png',
                        height: 38,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _navigateToProfilePage(
                          context); // Profil sayfasına yönlendirme işlevi çağrıldı
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Image.asset(
                        'assets/images/profile.png',
                        height: 38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Bildirim sayfasına yönlendirme işlevi
  void _navigateToNotificationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationPage()),
    );
  }

  // Profil sayfasına yönlendirme işlevi
  void _navigateToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }
}
