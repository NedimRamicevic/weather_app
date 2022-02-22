import 'dart:convert';
import 'package:todo_firebase/shared/constants.dart';
import 'package:http/http.dart' as http;

class TimeServise {
  Future<CurrentTime> fetchTime() async {
    final response = await http
        .get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/Istanbul'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return CurrentTime.fromJSon(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load time');
    }
  }
}

class WeatherServise {
  Future<CurrentWeather> fetchWeather() async {
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=London&units=metric&cnt=7&appid=4cb5591bc154c06ef202e10a2ae5757b'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("asdasdasdasd ${response.body}");
      return CurrentWeather.fromJSon(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load time');
    }
  }
}
