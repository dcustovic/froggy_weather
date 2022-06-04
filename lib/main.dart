
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/data_weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  WeatherModel _response;
  bool isLoading = false;
  String condition;

  void getCondition() {
    if(_response.weatherinfo.main != null) {
        condition = _response.weatherinfo.main;
        print(condition);
      }
    }
  
  void _search() async {
    setState(() => isLoading = true);
    final response = await _dataService.getDataWeather(_cityTextController.text);
    setState(() => _response = response);
    setState(() => isLoading = false);

    getCondition();
  }

  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: condition == 'Clouds' ? DecorationImage(
                  image: AssetImage("lib/assets/images/clouds.jpg"), 
                  fit: BoxFit.cover
              ) : condition == 'Rain' ? DecorationImage(
                  image: AssetImage("lib/assets/images/thunderstorm.jpg"), 
                  fit: BoxFit.cover
              ) : condition == 'Snow' ? DecorationImage(
                  image: AssetImage("lib/assets/images/snow.jpg"), 
                  fit: BoxFit.cover
              ) : condition == 'Thunderstorm' ? DecorationImage(
                  image: AssetImage("lib/assets/images/thunderstorm.jpg"), 
                  fit: BoxFit.cover
              )  : condition == 'Clear' ? DecorationImage(
                  image: AssetImage("lib/assets/images/clear.jpg"), 
                  fit: BoxFit.cover
              ) : condition == 'Drizzle' ? DecorationImage(
                  image: AssetImage("lib/assets/images/drizzle.jpg"), 
                  fit: BoxFit.cover
              ) : null,
              color: Color.fromARGB(255, 44, 44, 44),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
    
                    if (isLoading || _response == null) 
                     Container(
                      child: const FlareActor("lib/assets/images/spinworld.flr", fit: BoxFit.contain, animation: "roll"),
                      height: 270,
                      width: 270,
                    ),
                    if (_response != null && isLoading == false) 
                      Column(children: [
                        if( condition == 'Clear') 
                          Container(
                            child: FlareActor("lib/assets/images/sunny.flr", fit: BoxFit.contain, animation: "01d"),
                            height: 150,
                            width: 150,
                          ),
                        if( condition == 'Clouds') 
                          Container(
                            child: FlareActor("lib/assets/images/allweather.flr", fit: BoxFit.contain, animation: "03d"),
                            height: 150,
                            width: 150,
                          ),
                        if( condition == 'Rain') 
                          Container(
                            child: FlareActor("lib/assets/images/allweather.flr", fit: BoxFit.contain, animation: "09d"),
                            height: 150,
                            width: 150,
                          ),
                        if( condition == 'Snow') 
                          Container(
                            child: FlareActor("lib/assets/images/allweather.flr", fit: BoxFit.contain, animation: "13d"),
                            height: 150,
                            width: 150,
                          ),
                        if( condition == 'Thunderstorm') 
                          Container(
                            child: FlareActor("lib/assets/images/allweather.flr", fit: BoxFit.contain, animation: "11d"),
                            height: 150,
                            width: 150,
                          ),
                        if( condition == 'Drizzle') 
                          Container(
                            child: FlareActor("lib/assets/images/allweather.flr", fit: BoxFit.contain, animation: "09d"),
                            height: 150,
                            width: 150,
                          ),
                        
                       
                    
                        
                        Text(
                          '${_response.temp.temp.ceil()}°C',
                          style: TextStyle(fontSize: 45, color: Color.fromARGB(255, 240, 240, 240))
                          ), 
                        Text(
                          _response.name, 
                          style: TextStyle(fontSize: 21, color: Color.fromARGB(255, 240, 240, 240))
                          ),
                        Text(
                          _response.weatherinfo.description, 
                          style: TextStyle(fontSize: 14.5, color: Color.fromARGB(255, 240, 240, 240))
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: SizedBox(
                        width: 120,
                          child: TextField(
                            autofocus: true,
                            style: TextStyle(color: Colors.black87),
                            controller: _cityTextController,
                            decoration: InputDecoration(labelText: 'City'),
                            textAlign: TextAlign.center
                          ),
                      ),
                    ),
                    ElevatedButton(onPressed: _search, child: Text('Search'), style: ElevatedButton.styleFrom(
    primary: Colors.black54, // background
    onPrimary: Colors.white70, // foreground
  ),
    )
                  ],
              ),
            ),
          ),
        ));
  }

}