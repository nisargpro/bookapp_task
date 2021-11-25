import 'dart:convert';

import 'package:bookapp_task/http_model.dart';
import 'package:http/http.dart';

class Network{
  Future<Post> getpost()async{
    var url = "https://run.mocky.io/v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6";

    Response response = await get(Uri.parse(Uri.encodeFull(url)));

    if(response.statusCode == 200){
      //print("News data:${response.body[0]} ");
      return Post.fromJson(json.decode(response.body));
    }else{
      throw Exception("Error getting the news");
    }
  }
}