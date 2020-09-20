import 'package:flutter/material.dart';

import 'model.dart';

class DetailsPage extends StatefulWidget {
  final PostModel model;

  DetailsPage(this.model);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.title.toUpperCase()),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Text(
                widget.model.id.toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 64.0,
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              alignment: Alignment.center,
              child: Text(
                widget.model.title.toUpperCase(),
                style: TextStyle(color: Colors.cyan, fontSize: 16),
                maxLines: 2,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              alignment: Alignment.center,
              child: Text(
                widget.model.body,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
