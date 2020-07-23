import 'package:climaapp/services/location.dart';
import 'package:climaapp/services/networking.dart';
import 'networking.dart';

const apiKey = 'fa287b391bc48d53fd02e9263d87bb42';
const weatherMapsURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeatherData(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$weatherMapsURL?$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCurrentLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$weatherMapsURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
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
      return 'It\'s 🍦 time in';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in';
    } else {
      return 'Bring a 🧥 just in case in';
    }
  }
}
