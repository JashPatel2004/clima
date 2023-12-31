import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey='86c9e5c7b9e9826f3a9df1d092dd9df5';
const openWeatherURL=  'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getCityWeather(String cityName) async {
    NetworkHelper networkHelp = NetworkHelper(
        '$openWeatherURL?q=$cityName&appid=$apiKey&units=metric');
    return await networkHelp.getData();
  }
  Future<dynamic> getLocationWeather() async{
    location loc = location();
    await loc.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var weatherData=await networkHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}