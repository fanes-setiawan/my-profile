// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

class dashboardController {
  void Function(void Function()) setState;
  dashboardController({required this.setState});
  List<Map<String, dynamic>> dataPorto = [
    {
      "title": "Fugi_movie_app_team5",
      "detail":
          "The Fugi Movie App Teams Minibootcamp is a design and development program for teams of students who want to create a mobile movie app using the Flutter framework. The program is designed to teach students the skills they need to design and implement attractive and responsive user interfaces (UIs), as well as how to work effectively as a team.",
      "urlImage": "https://i.ibb.co/99VJndY/1.png",
    },
    {
      "title": "Building OVO App UI",
      "detail":
          "Slicing UI is the process of converting a UI design into individual UI elements. This involves creating separate files for each element, such as buttons, icons, and text boxes. Each file should contain the code for the element's appearance and behavior.",
      "urlImage": "https://i.ibb.co/McWpwhy/2.png",
    },
    {
      "title": "Smart Home App",
      "detail":
          "The Smart Home App is a free app that allows you to control your home from anywhere in the world. The app includes a variety of features,",
      "urlImage": "https://i.ibb.co/8cRjDLy/3.png",
    },
  ];

  void openWhatsApp() async {
    String phoneNumber = "+6288225409824";
    String message = "Halo! Fanes Setiawan";
    String url = "https://wa.me/$phoneNumber?text=${Uri.parse(message)}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void openInstagram() async {
    String username = "fanes404"; // ganti dengan nama pengguna Instagram Anda
    String url = "https://www.instagram.com/$username/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void openLinkedIn() async {
    String username = "fanes-setiawan";
    String url = "https://www.linkedin.com/in/$username/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void openGitHub() async {
    String username = "fanes-setiawan";
    String url = "https://github.com/$username";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
