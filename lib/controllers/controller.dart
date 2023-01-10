import 'dart:async';

import 'package:apiuse/models/api_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AppController extends GetxController {
  var getPhoto = <Welcome>[].obs;
  var photoloading = true.obs;

  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  callpostmethod() async {
    try {
      photoloading.value = true;

      var result = await getallposts();
      if (result != null) {
        getPhoto.assignAll(result);
      } else {
        print("null");
      }
    } finally {
      photoloading.value = false;
    }
    update();
  }

  Future<List<Welcome>?> getallposts() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        List jsonresponse = convert.jsonDecode(response.body);
        return jsonresponse.map((e) => Welcome.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
    return null;
  }
}
