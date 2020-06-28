import '../services/networking.dart';
import '../services/location.dart';

const apiKey = 'd2bb635cae3e7ea1ce1544d2ba73e185';
const weatherUrl =
    'https://api.openweathermap.org/data/2.5/weather?appid=$apiKey&units=metric';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper helper = NetworkHelper('$weatherUrl&q=$cityName');

    var weatherData = await helper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    double lat = location.latitude;
    double lon = location.longitude;

    NetworkHelper helper = NetworkHelper('$weatherUrl&lat=$lat&lon=$lon');

    var weatherData = await helper.getData();
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
