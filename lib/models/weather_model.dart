class Temperature {
  final num temp;
  final num tempMin;
  final num tempMax;

  const Temperature({this.temp, this.tempMin, this.tempMax});

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      temp: json['temp'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
    );
  }
}

class WeatherInfo {
  final String description;
  final String icon;
  final String main;

  const WeatherInfo({this.description, this.icon, this.main});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      description: json['description'],
      icon: json['icon'],
      main: json['main']
    );
  }
}

class WeatherModel {
  final String name;
  final Temperature temp;
  final WeatherInfo weatherinfo;

  String get iconUrl {
    return 'http://openweathermap.org/img/wn/${weatherinfo.icon}@2x.png';
  }

  // constructor
  const WeatherModel({this.name, this.temp, this.weatherinfo});

  // factory constructor
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['name'],
      temp: Temperature.fromJson(json['main']),
      weatherinfo: WeatherInfo.fromJson(json['weather'][0])
    );
  }
}