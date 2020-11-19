import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/repo/model/model.dart';
import 'package:flutter_clean_architecture/ui/details_page.dart';
import 'package:get/get.dart';

class HomePageHelper {
  static Widget showListData(List<PostModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return _getListTile(data[index]);
      },
    );
  }

  static Widget showError() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Something went wrong!\nPlease try again",
        style: TextStyle(
          color: Colors.red,
          fontSize: 20.0,
        ),
      ),
    );
  }

  static Widget showProgress() {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  static Widget _getListTile(PostModel model) {
    return InkWell(
      onTap: () {
        Get.to(DetailsPage(model));
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
