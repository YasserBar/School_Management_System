import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tr_app/data/network_api_service.dart';
import 'package:tr_app/res/api_url.dart';

class OpenController extends GetxController {
  Dio dio = Dio();

  Future<String> getFilePath(String filname) async {
    final dir = await getApplicationDocumentsDirectory();
    print(dir.toString());
    return "${dir.path}/$filname";
  }

  void startdownloading(String filename) async {
    String url = "${EndPointGuest.baseUrl}$filename";    
    String path = await getFilePath(filename);
    NetworkApiService hed = NetworkApiService();

    dio.options.headers = hed.setHeaders(hed.token);
    await dio.download(url, path, deleteOnError: true);

    OpenFile.open(path);
  }
}
