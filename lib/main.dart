import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  final String profilePicUrl = 'https://media.licdn.com/dms/image/D4D03AQEQl5UOGuHs8w/profile-displayphoto-shrink_800_800/0/1718527035295?e=1725494400&v=beta&t=xeORXNddmlQUrKs5vX3Z76adajUeM8-36uv6-WqUDPM';
  final String linkedinUrl = 'https://www.linkedin.com/in/aayush-kewat-a3a91a215/?originalSubdomain=in';
  final String instagramUrl = 'https://www.instagram.com/aayush_kewat07/';
  final String githubUrl = 'https://github.com/AXE0710';

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(profilePicUrl),
            ),
            SizedBox(height: 20),
            Text(
              'Aayush Kewat',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.link),
              label: Text('LinkedIn'),
              onPressed: () => _launchURL(linkedinUrl),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.link),
              label: Text('Instagram'),
              onPressed: () => _launchURL(instagramUrl),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.link),
              label: Text('GitHub'),
              onPressed: () => _launchURL(githubUrl),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            Divider(),
            Text(
              'Skills',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0,
              children: [
                Chip(label: Text('Flutter')),
                Chip(label: Text('React Native')),
                Chip(label: Text('MySQL')),
                Chip(label: Text('REST APIs')),
                 Chip(label: Text('AI')),
                Chip(label: Text('Full Stack')),
                Chip(label: Text('Ruby on rails')),
                Chip(label: Text('Game Dev')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
