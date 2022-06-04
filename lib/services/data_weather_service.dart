import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_cred.dart';


class DataService {
 

  Future<WeatherModel> getDataWeather(String city) async {

    final queryParams = {
      'q': city,
      'appid': credentials,
      'units': 'metric'
    };
    final uri = Uri.http('api.openweathermap.org', '/data/2.5/weather', queryParams);
    final response = await http.get(uri);


    if (response.statusCode == 200) {
      print(response.body);
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to load city weather.');
    }
    
  }
}


