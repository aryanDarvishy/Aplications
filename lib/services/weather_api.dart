import 'network_helper.dart';

class WeatherModel {
  final key = '15872b76925ffb38a20df497e435fc1c';

  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$key';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<bool> isCityValid(String city) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    if (weatherData == -1) {
      return false;
    } else {
      return true;
    }
  }
}
