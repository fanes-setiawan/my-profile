// ignore_for_file: prefer_const_constructors, deprecated_member_use, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class X extends StatefulWidget {
  @override
  _XState createState() => _XState();
}

class _XState extends State<X> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _detailController = TextEditingController();
  final _urlImageController = TextEditingController();
  final _urlVideoController = TextEditingController();
  final _urlGithubController = TextEditingController();
  final _databaseReference = FirebaseDatabase.instance.reference();

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      String title = _titleController.text;
      String detail = _detailController.text;
      String urlGithub = _urlGithubController.text;
      String urlImage = _urlImageController.text;
      String urlVideo = _urlVideoController.text;
      String time = DateTime.now().toString();

      // Mengirim data ke Firebase Realtime Database
      _databaseReference.child('portfolio').push().set({
        'title': title,
        'detail': detail,
        'urlGithub': urlGithub,
        'urlImage': urlImage,
        'urlVideo': urlVideo,
        'time': time,
      }).then((_) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Data successfully sent!')));
        _titleController.clear();
        _detailController.clear();
        _urlGithubController.clear();
        _urlImageController.clear();
        _urlVideoController.clear();
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send data: $error')));
      });
    }
  }

  void _deleteData(String key) {
    _databaseReference.child('portfolio').child(key).remove().then((_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Data successfully deleted!')));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete data: $error')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Your Project'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Name Project',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: _detailController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Detail',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter detail';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: _urlGithubController,
                        decoration: InputDecoration(
                          labelText: 'Github URL',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Github URL';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: _urlImageController,
                        decoration: InputDecoration(
                          labelText: 'Image URL',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an image URL';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: _urlVideoController,
                        decoration: InputDecoration(
                          labelText: 'Video URL',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a video URL';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _submitData,
                        // ignore: sort_child_properties_last
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          textStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: _databaseReference.child('portfolio').onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.value == null) {
                    return Center(child: Text('No data available.'));
                  }

                  Map<dynamic, dynamic> data =
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                  List<Map<dynamic, dynamic>> items = [];

                  data.forEach((key, value) {
                    Map<dynamic, dynamic> item = value as Map<dynamic, dynamic>;
                    item['key'] = key;
                    items.add(item);
                  });

                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10.0),
                          leading: Image.network(items[index]['urlImage']),
                          title: Text(items[index]['title']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(items[index]['detail']),
                              SizedBox(height: 5),
                              Text('Github: ${items[index]['urlGithub']}'),
                              GestureDetector(
                                onTap: () async {
                                  final url = items[index]['urlVideo'];
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Text(
                                  'Watch Video',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteData(items[index]['key']);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
