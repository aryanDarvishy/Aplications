import 'package:flutter/material.dart';
import '../services/weather_api.dart';
import '../services/degrees.dart';

class CityScreen extends StatefulWidget {
  const CityScreen(this.weather, {super.key});

  final weather;

  @override
  State<CityScreen> createState() => _CityScreenState();

}

//нужно сделать метод с иконками и можно будет переходить к созданию красивого приложения

class _CityScreenState extends State<CityScreen> {
  Degrees degrees = Degrees();
  WeatherModel weatherApi = WeatherModel();
  String? city;
  int? temp;
  String? country;

  @override
  void initState() {
    super.initState();
    setState(() {
      var weather = widget.weather;
      city = weather['name'];
      temp = degrees.getCelsius(weather['main']['temp']);
      country = weather['sys']['country'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
                Icons.arrow_back_ios_new_outlined, color: Colors.red)),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/rain.png'),
              fit: BoxFit.cover,
            )),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 15),
                Text('$city, $country',
                    style: const TextStyle(fontSize: 35, color: Colors.white)),
                const SizedBox(height: 15),
                Text(
                  '$temp°C',
                  style: const TextStyle(fontSize: 47, color: Colors.white),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
