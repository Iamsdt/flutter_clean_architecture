import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/model.dart';

class DetailsPage extends StatelessWidget {
  final PostModel model;

  DetailsPage(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title.toUpperCase()),
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
                model.id.toString(),
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
                model.title.toUpperCase(),
                style: TextStyle(color: Colors.cyan, fontSize: 16),
                maxLines: 2,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              alignment: Alignment.center,
              child: Text(
                model.body,
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
