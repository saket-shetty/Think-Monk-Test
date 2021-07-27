import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:teach_us/screens/post_listing/post_listing_data.dart';
import 'package:teach_us/screens/post_listing/post_listing_repository.dart';

class PostListingBloc {
  PostListingRepository _repository = new PostListingRepository();

  List<PostListingData> list = [];

  StreamController<List<PostListingData>> _postListStreamController =
      new BehaviorSubject();

  Stream<List<PostListingData>> get postListingStream =>
      _postListStreamController.stream;

  StreamSink<List<PostListingData>> get postListingSink =>
      _postListStreamController.sink;

  PostListingBloc() {
    getPostListingFromRepository();
  }

  Future<void> getPostListingFromRepository() async {
    list = await _repository.getPostList();
    postListingSink.add(list);
  }

  Future<http.Response>deletePosts(List<PostListingData> deletePostId) async {
    http.Response _response = await _repository.deletePosts([]);
    if (_response.statusCode == 200) {
      deletePostId.forEach((element) {
        list.remove(element);
      });
      postListingSink.add(list);
    }
    return _response;
  }

  dispose() {
    _postListStreamController.close();
  }
}
