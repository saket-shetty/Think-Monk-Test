import 'package:http/http.dart' as http;
import 'package:teach_us/screens/post_listing/post_listing_data.dart';

abstract class NetworkInterface {
  Future<http.Response> getRequest(String url);
  Future<http.Response> postRequest(String url, PostListingData data);
  Future<http.Response> deleteRequest(String url, {dynamic parameter});
}
