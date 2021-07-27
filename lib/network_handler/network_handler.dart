import 'package:http/http.dart' as http;
import 'package:teach_us/Network_Handler/network_interface.dart';
import 'package:teach_us/screens/post_listing/post_listing_data.dart';

class NetworkHandler implements NetworkInterface {
  @override
  Future<http.Response> getRequest(String url) async {
    http.Response _response = await http.get(Uri.parse(url));
    return _response;
  }

  @override
  Future<http.Response> deleteRequest(String url, {dynamic parameter}) async {
    http.Response _response = await http.delete(Uri.parse(url + "/1"));
    return _response;
  }

  @override
  Future<http.Response> postRequest(String url, PostListingData data) async {
    http.Response _response =
        await http.post(Uri.parse(url), body: data.toMap());
    return _response;
  }
}
