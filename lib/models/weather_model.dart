class WeatherModel {
  final String city;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final DateTime sunrise;
  final DateTime sunset;
  final String icon;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json["name"],
      temperature: json["main"]["temp"].toDouble(),
      description: json["weather"][0]["description"],
      humidity: json["main"]["humidity"],
      windSpeed: json["wind"]["speed"].toDouble(),
      sunrise: DateTime.fromMillisecondsSinceEpoch(json["sys"]["sunrise"] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json["sys"]["sunset"] * 1000),
      icon: json["weather"][0]["icon"],
    );
  }
}
