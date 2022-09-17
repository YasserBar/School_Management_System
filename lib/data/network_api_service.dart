import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http;
import 'package:tr_app/data/app_exceptions.dart';
import 'package:tr_app/main.dart';
import 'package:tr_app/res/api_url.dart';

class NetworkApiService {

  var token = prefs!.getString('token');

  Future postlogindata(data, endpoint) async {
    var fullUrl = EndPointGuest.baseUrl + endpoint;
    dynamic responseJson;
    final ioClient = HttpClient();
    ioClient.connectionTimeout = const Duration(seconds: 10);
    final client = http.IOClient(ioClient);
    try{
      var response = await client.post(Uri.parse(fullUrl),
        body: data, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
        }
      );
      responseJson = returnResponse(response);
    } on SocketException catch(e){
      throw FetchDataException(e.toString().substring(0,39));
    } finally{
      client.close();
    }
    return responseJson;
  }

  Future postdata(dynamic data, String endpoint) async {
    var fullUrl = EndPointGuest.baseUrl + endpoint;
    dynamic responseJson;
    final ioClient = HttpClient();
    ioClient.connectionTimeout = const Duration(seconds: 10);
    final client = http.IOClient(ioClient);
    try{
      var response = await client.post(Uri.parse(fullUrl),
          body: data, headers: setHeaders(token));
      responseJson = returnResponse(response);
    } on SocketException catch(e){
      throw FetchDataException(e.toString().substring(0,39));
    } finally{
      client.close();
    } 
    return responseJson;
  }

  Future getdata(String endpoint) async {
    var fullUrl = EndPointGuest.baseUrl + endpoint;
    dynamic responseJson;
    final ioClient = HttpClient();
    ioClient.connectionTimeout = const Duration(seconds: 10);
    final client = http.IOClient(ioClient);
    try{
      var response = await client.get(Uri.parse(fullUrl),
        headers: setHeaders(token)); 
      responseJson = returnResponse(response);
    } on SocketException catch(e){
      throw FetchDataException(e.toString().length >= 39 ? e.toString().substring(0,39) : e.toString());
    }finally{
      client.close();
    } 
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    
    switch (response.statusCode) {
      case 200:
      dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
      dynamic responseJson = jsonDecode(response.body);
        throw BadRequestException(responseJson["message"].toString());
      case 401:{
        throw UnauthorisedException(response.body.toString());
      }
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
          'Error accured while communicating with server with status code ${response.statusCode}');
    }
  }
























  uploadfile(String endpoint, file, id, name) async {
    var fullurl = EndPointGuest.baseUrl + endpoint;
    var request = http.MultipartRequest('POST', Uri.parse(fullurl));
    request.headers.addAll(setHeaders(token));
    request.files.add(await http.MultipartFile.fromPath('file', file));
    request.fields['file_name'] = name;
    request.fields['class_room_id'] = id;
    var response = await request.send();
    var resp = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      return true;
    } else {
      print(resp.body.toString());
      return false;
    }
  }
   uploadimageprofile(String endpoint, file) async {
    var fullurl = EndPointGuest.baseUrl + endpoint;
    var request = http.MultipartRequest('POST', Uri.parse(fullurl));
    request.headers.addAll(setHeaders(token));
    request.files.add(await http.MultipartFile.fromPath('image', file));
    var response = await request.send();
    var resp = await http.Response.fromStream(response);
    print(resp.body.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      print(resp.body.toString());
      return false;
    }
  }

  uploadtimetable(String endpoint, file, id) async {
    var fullurl = EndPointGuest.baseUrl + endpoint;
    var request = http.MultipartRequest('POST', Uri.parse(fullurl));
    request.headers.addAll(setHeaders(token));
    request.files.add(await http.MultipartFile.fromPath('image', file));
    request.fields['class_room_id'] = id;
    var response = await request.send();
    var resp = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      return true;
    } else {
      print(resp.body.toString());
      return false;
    }
  }

  setHeaders(token) => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

}



