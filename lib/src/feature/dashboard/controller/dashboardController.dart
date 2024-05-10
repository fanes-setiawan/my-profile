// ignore_for_file: camel_case_types

import '../../../constant/api/api.dart';

class dashboardController {
  void Function(void Function()) setState;
  dashboardController({required this.setState});
  List<Map<String, dynamic>> dataPorto = [
    {
      "title": "Fugi_movie_app_team5",
      "detail":
          "The Fugi Movie App Teams Minibootcamp is a design and development program for teams of students who want to create a mobile movie app using the Flutter framework. The program is designed to teach students the skills they need to design and implement attractive and responsive user interfaces (UIs), as well as how to work effectively as a team.",
      "urlImage":
          "${myapi().firebaseUrl}/v0/b/profile-19cfe.appspot.com/o/1.png?alt=media&token=e1b4fde5-8210-4060-8905-31415ba36220",
    },
    {
      "title": "Building OVO App UI",
      "detail":
          "Slicing UI is the process of converting a UI design into individual UI elements. This involves creating separate files for each element, such as buttons, icons, and text boxes. Each file should contain the code for the element's appearance and behavior.",
      "urlImage":
          "${myapi().firebaseUrl}/v0/b/profile-19cfe.appspot.com/o/2.png?alt=media&token=25668454-bfa4-4091-9110-247e2726fa1f",
    },
    {
      "title": "Smart Home App",
      "detail":
          "The Smart Home App is a free app that allows you to control your home from anywhere in the world. The app includes a variety of features,",
      "urlImage":
          "${myapi().firebaseUrl}/v0/b/profile-19cfe.appspot.com/o/3.png?alt=media&token=e2299fcb-4659-44cb-8223-ece4df5f2f33",
    },
  ];
}
