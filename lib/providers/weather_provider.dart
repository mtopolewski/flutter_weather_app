import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_weather_app1/const.dart';
import 'package:flutter_weather_app1/models/forecast_response.dart';
import 'package:http/http.dart' as http;

class WeatherProvider with ChangeNotifier {
  ForecastResponse? _forecast;

  ForecastResponse? get forecast => _forecast;

  Future<void> fetchForecast(double lat, double lng) async {
    var res = await http.get(Uri.parse(
        "${Const.darkSkyBaseUrl}/${Const.darkSkyUserKey}/$lat,$lng?units=ca&lang=en"));
    Map<String, dynamic> resMap = jsonDecode(res.body);
    _forecast = ForecastResponse.fromJson(resMap);
    notifyListeners();
  }
}
