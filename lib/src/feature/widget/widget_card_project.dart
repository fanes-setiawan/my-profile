import 'package:flutter/material.dart';

class WidgetCardProject extends StatelessWidget {
  const WidgetCardProject({
    super.key,
    required this.index,
    required this.items,
  });

  final int index;
  final List<Map> items;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  items[index]['urlImage'],
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

        // ListTile(
        //   contentPadding: EdgeInsets.all(10.0),
        //   leading: Image.network(items[index]['urlImage']),
        //   title: Text(items[index]['title']),
        //   subtitle: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(items[index]['detail']),
        //       SizedBox(height: 5),
        //       Text('Github: ${items[index]['urlGithub']}'),
        //       GestureDetector(
        //         onTap: () async {
        //           final url = items[index]['urlVideo'];
        //           if (await canLaunch(url)) {
        //             await launch(url);
        //           } else {
        //             throw 'Could not launch $url';
        //           }
        //         },
        //         child: Text(
        //           'Watch Video',
        //           style: TextStyle(color: Colors.blue),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
//         );
//   }
// }
