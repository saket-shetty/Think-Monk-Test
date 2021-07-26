import 'package:http/http.dart' as http;
import 'package:teach_us/Network_Handler/network_interface.dart';

class NetworkHandler implements NetworkInterface {
  @override
  Future<http.Response> getRequest(String url) async {
    http.Response _response = await http.get(Uri.parse(url));
    return _response;
  }

  @override
  Future<http.Response> deleteReuest(String url, int id) async {
    http.Response _response =
        await http.delete(Uri.parse(url), body: {"id": id});
    return _response;
  }

  @override
  Future<http.Response> postRequest(String url, int id) async {
    http.Response _response = await http.post(Uri.parse(url), body: {});
    return _response;
  }
}
