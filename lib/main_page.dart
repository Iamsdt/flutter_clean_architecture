import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/model.dart';
import 'package:http/http.dart' as http;

import 'details_page.dart';

class MyPostUI extends StatefulWidget {
  @override
  _MyPostUIState createState() => _MyPostUIState();
}

class _MyPostUIState extends State<MyPostUI> {
  Future<List<PostModel>> getAllData() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(url);
    return postModelFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Post"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getAllData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return getListTile(snapshot.data[index]);
              },
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget getListTile(PostModel model) {
    return InkWell(
      onTap: () {
        // next page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPage(model)),
        );
      },
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              model.id.toString(),
              style: TextStyle(color: Colors.red, fontSize: 24.0),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            model.title.toUpperCase(),
            style: TextStyle(color: Colors.cyan, fontSize: 16),
            maxLines: 2,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            model.body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
