import 'package:http/http.dart';
import 'package:teach_us/endpoints/endpoints.dart';
import 'package:teach_us/network_handler/network_handler.dart';
import 'package:teach_us/screens/post_listing/post_listing_data.dart';

class AddPostRepository {
  NetworkHandler _networkHandler = NetworkHandler();

  Future<Response> addPostToDatabase(PostListingData data) async {
    Response _response =
        await _networkHandler.postRequest(Endpoints.addPostEndpoint, data);
    return _response;
  }
}
