import 'dart:convert';

import 'package:flutter_clean_architecture/model.dart';

List<PostModel> parseApiResponse(String responseBody) {
  return List<PostModel>.from(
    json.decode(responseBody).map(
          (x) => PostModel.fromJson(x),
        ),
  );
}
