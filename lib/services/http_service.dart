import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/model.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  late String _base_url;
  late String _api_key;

  HTTPService() {
    AppConfig _config = getIt.get<AppConfig>();
    _base_url = _config.BASE_API_URL;
    _api_key = _config.API_KEY;
  }

  Future<Response> get(String _path, {Map<String, dynamic>? query}) async {
    /* try {
      
    } on DioError catch (e) {

    } */
    String _url = '$_base_url$_path';
    Map<String, dynamic> _query = {
      'api_key': _api_key,
      'language': 'en-Us',
    };
    if (query != null) {
      _query.addAll(query);
    }
    return await dio.get(_url, queryParameters: _query);
  }
}
