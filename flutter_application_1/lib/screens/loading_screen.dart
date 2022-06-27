
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/location_screen.dart';
// import 'package:flutter_application_1/services/networking.dart';
import 'package:flutter_application_1/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:geolocator/geolocator.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}



class _LoadingScreenState extends State<LoadingScreen> {
// double? latitude;
// double? longitude;
@override
  void initState() {
    getLocation();
    super.initState();
  }
  /*:::::::::::::::::::::::Get Location:::::::::::::::::::::::::::*/
  void getLocation()async{
    WeatherModel loadingScreen=  WeatherModel();
    var weatherData=await loadingScreen.getLocationweather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return  LocationScreen(locationWeather:weatherData,);
    }));

} 

 



  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCircle(color: Colors.purple,size: 90);
  }
}
