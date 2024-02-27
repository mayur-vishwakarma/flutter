import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:photo_app/imagemodel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int count = 1;
  List<ImageModel> images = [];

 Future<void> updateImage() async {
  count++;
  var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos/$count");
  var response = await http.get(uri);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    setState(() {
      images.add(
        ImageModel(data['id'], data['url'], data['title']));
    });
  } else {
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PhotoApp',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.network(images[index].url),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(images[index].title),
                    ],
                  ),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: updateImage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
