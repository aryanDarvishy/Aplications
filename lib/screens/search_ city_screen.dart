import 'package:flutter/material.dart';
import '../screens/city_screen.dart';
import '../services/weather_api.dart';

class SearchCityScreen extends StatefulWidget {
  const SearchCityScreen({super.key});

  @override
  State<SearchCityScreen> createState() => _SearchCityScreenState();
}

class _SearchCityScreenState extends State<SearchCityScreen> {
  TextEditingController controller = TextEditingController();
  WeatherModel weatherModel = WeatherModel();
  var weatherCity;
  Color colorBorderField = Colors.blue;
  double borderWidth = 2;
  String? errorText;
  bool? valid;

  // написать метод который фиксит ошибку при записи несуществующего города
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'lib/assets/images/x1.jpg',
                  ))),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 25),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: colorBorderField, width: borderWidth),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: colorBorderField, width: borderWidth),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      icon: const Icon(Icons.location_city,
                          size: 40, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Text',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.lightGreen),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)))),
                    onPressed: () async {
                      valid = await weatherModel.isCityValid(controller.text);
                      if (valid == true) {
                        weatherCity =
                            await weatherModel.getCityWeather(controller.text);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CityScreen(weatherCity)));
                        setState(() {
                          colorBorderField = Colors.blue;
                          borderWidth = 2.0;
                        });
                      } else {
                        setState(() {
                          colorBorderField = Colors.red;
                          borderWidth = 4.0;
                        });
                      }
                    },
                    child: const Text(
                      'Search City',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
