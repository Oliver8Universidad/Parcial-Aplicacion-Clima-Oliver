import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  WeatherModel? weather;
  bool loading = false;

  void getWeather() async {
    setState(() => loading = true);

    final service = WeatherService();
    final result = await service.fetchWeather(_cityController.text);

    setState(() {
      weather = result;
      loading = false;
    });
  }

  String formatHour(DateTime date) {
    return "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6B8FF),
        elevation: 0,
        title: const Text(
          'Aplicacion de Clima Parcial',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

  
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                Text("BIENVENIDO",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,),),
                SizedBox(height: 10),       

                Text("Ingrese el nombre del país que desea conocer su clima",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),
                  textAlign: TextAlign.center,
                ),
                    SizedBox(height: 20),

                TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Ingresa una ciudad",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),


                const SizedBox(height: 15),

                ElevatedButton(
                  onPressed: getWeather,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD6B8FF),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Buscar", style: TextStyle(fontSize: 18)),
                ),

                const SizedBox(height: 25),

                if (loading) const CircularProgressIndicator(),

                if (weather != null && !loading)
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: const Color(0xFFFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            weather!.city,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Image.network(
                            "https://openweathermap.org/img/wn/${weather!.icon}@4x.png",
                            width: 120,
                            height: 120,
                          ),

                          Text(
                            "${weather!.temperature.toStringAsFixed(1)} °C",
                            style: const TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Text(
                            weather!.description,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.grey,
                            ),
                          ),

                          const Divider(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Icon(Icons.water_drop, color: Colors.purple),
                                  Text("Humedad"),
                                  Text("${weather!.humidity}%"),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(Icons.air, color: Colors.deepPurple),
                                  Text("Viento"),
                                  Text("${weather!.windSpeed} m/s"),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Icon(Icons.wb_sunny, color: Colors.orange),
                                  Text("Amanecer"),
                                  Text(formatHour(weather!.sunrise)),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(Icons.nightlight_round, color: Colors.deepOrange),
                                  Text("Atardecer"),
                                  Text(formatHour(weather!.sunset)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
