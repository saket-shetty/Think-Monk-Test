import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teach_us/Network_Handler/network_handler.dart';
import 'package:teach_us/endpoints/endpoints.dart';
import 'package:teach_us/screens/post_listing/post_listing_data.dart';

class PostListingRepository {
  NetworkHandler _networkHandler = new NetworkHandler();

  Future<List<PostListingData>> getPostList() async {
    List<PostListingData> _list = [];
    http.Response _response =
        await _networkHandler.getRequest(Endpoints.getPostEndpoint);
    if (_response.statusCode == 200) {
      _list = PostListingData.fromMapList(jsonDecode(_response.body)["data"]);
    } else {
      //Something went wrong snackbar.
    }
    return _list;
  }

  Future<http.Response> deletePosts(List<int> getPostId) async {
    Map<String, dynamic> parameter = {"id": getPostId.toString()};
    http.Response _response = await _networkHandler
        .deleteRequest(Endpoints.deletePostEndpoint, parameter: parameter);
    if (_response.statusCode == 200) {
      print("Post deleted successfully");
    } else {
      print("Something went wrong");
    }
    return _response;
  }
}
