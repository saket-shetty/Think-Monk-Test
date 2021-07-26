import 'package:http/http.dart' as http;

abstract class NetworkInterface{
  Future<http.Response> getRequest(String url);
  Future<http.Response> postRequest(String url, int id);
  Future<http.Response> deleteReuest(String url, int id);
}