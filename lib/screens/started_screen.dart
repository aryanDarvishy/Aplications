import 'package:flutter/material.dart';
import '../const/const.dart';
import '../screens/search_ city_screen.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({Key? key}) : super(key: key);

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  @override
  Widget build(BuildContext context) {
    Constants myConst = Constants();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: myConst.primarySwatch.withOpacity(0.7),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/assets/icons/weather_rain_cloud.png',
                    width: screenSize.width),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const SearchCityScreen()));
                  },
                  child: Container(
                    height: 60,
                    width: screenSize.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(22)),
                      color: myConst.primarySwatch,
                    ),
                    child: const Center(
                        child: Text('Welcome',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w500))),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
