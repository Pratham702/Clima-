
import 'package:clima/location.dart';
import 'package:clima/services/networking.dart';
const apiKey='7ba99902e50211236d774cac8edec348';
const openWeatherMapUrl='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
 Future<dynamic> getCityWeather(String cityName)async{
    Networkhelper networkhelper =Networkhelper('$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData=await networkhelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getcurrentLocation();
    Networkhelper networkhelper = Networkhelper('$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData= await networkhelper.getData();
return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
