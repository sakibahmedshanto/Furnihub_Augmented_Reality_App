import 'package:e_comm/utils/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
        ),
        backgroundColor: AppConstant.appMainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/shanto.png'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildContactInfoItem(
              icon: Icons.phone,
              label: 'Phone Number',
              value: '+8801721665453',
              onTap: () => _launchURL('tel:+8801721665453'),
            ),
            SizedBox(height: 10),
            _buildContactInfoItem(
              icon: Icons.email,
              label: 'Email',
              value: 'sakibahmed21@iut-dhaka.edu',
              onTap: () => _launchURL('mailto:sakibahmed21@iut-dhaka.edu'),
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                'Social Media',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildContactInfoItem(
              icon: Icons.facebook,
              label: 'Facebook',
              value: 'Sakib Ahmed Shanto',
              onTap: () => _launchURL('https://www.facebook.com/profile.php?id=61554610147869'),
            ),
            SizedBox(height: 10),
            _buildContactInfoItem(
              icon: FontAwesomeIcons.linkedin,
              label: 'LinkedIn',
              value: 'Sakib Ahmed Shanto',
              onTap: () => _launchURL('https://www.linkedin.com/in/sakib-ahmed-shanto-5177b9147'),
            ),
            SizedBox(height: 10),
            _buildContactInfoItem(
              icon: Icons.message,
              label: 'WhatsApp',
              value: '+8801721665453',
              onTap: () => _launchURL('https://wa.me/+8801721665453'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoItem({
    required IconData icon,
    required String label,
    required String value,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
