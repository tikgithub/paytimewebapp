import 'package:dio/dio.dart';
import 'package:webapp/config/app.config.dart';

class APIConnectionService {
  String apiURL = AppConfig.APIURL;
  var http = new Dio();

  //Login Authenitcation Service
  void login() async {
    try {
      Map<String, dynamic> loginObject = {
        'email': 'tik@gmail.com',
        'password': 'Computerz1'
      };
      Response response =
          await http.post(apiURL + "/web/auth", data: loginObject);
      print(response.data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      if (e.response!.statusCode == 401) {
        print('');
      }
    }
  }
  //////////////////////////////

  //Payment API/////////////

  //////////////////////////
}
