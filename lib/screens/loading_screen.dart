import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {

          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }

  void getLocation() async{
    try{
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
      print(position.longitude);
      print(position.latitude);
    }catch(e){
      print(e);
    }
  }

  void getWeatherData() async{
    Uri url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Tagaytay&appid=10aaa059d782aca183d2720b06b542a3");
    Response response = await get(url);
    print(response.body);
    print(response.statusCode);
  }
}
