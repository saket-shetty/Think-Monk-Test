import 'dart:async';

import 'package:teach_us/screens/post_listing/post_listing_data.dart';
import 'package:teach_us/screens/post_listing/post_listing_repository.dart';

class PostListingBloc {
  PostListingRepository _repository = new PostListingRepository();

  StreamController<List<PostListingData>> _postListStreamController =
      new StreamController();

  Stream<List<PostListingData>> get postListingStream =>
      _postListStreamController.stream;

  StreamSink<List<PostListingData>> get postListingSink =>
      _postListStreamController.sink;

  PostListingBloc() {
    getPostListingFromRepository();
  }

  getPostListingFromRepository() async {
    List<PostListingData> _list = await _repository.getPostList();
    postListingSink.add(_list);
  }

  dispose() {
    _postListStreamController.close();
  }
}
