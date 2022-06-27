// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/city_screen.dart';
import 'package:geolocator/geolocator.dart';
import '../services/networking.dart';
import '/utilities/constants.dart';
import '../services/weather.dart';
import 'loading_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key,this.locationWeather}) : super(key: key);
  
  final  locationWeather;
  
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
 WeatherModel weatherModel=WeatherModel();
 dynamic weatherDecription;
 dynamic temprature;
 String? weatherIcon;
 String? cityName;
   @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }
   updateUI(dynamic weatherData)
   {
    // setState(() {
    //   if(weatherData==null)
    //   {
    //     temprature=0;
    //     weatherDecription="";
    //     weatherIcon="Error";
    //     cityName='';
    //     return;
    //   }
    setState(() {
     double temp=weatherData['main']['temp'];
     temprature=temp.toInt();
     weatherDecription=weatherModel.getMessage(temprature);
     var condition=weatherData['weather'][0]['id'];
     weatherIcon=weatherModel.getWeatherIcon(condition);
     cityName=weatherData['name'];
     print(weatherData['weather'][0]['id']);
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                        var weatherData=await weatherModel.getLocationweather();
                        updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,color: Colors.grey[300],
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                       var typedName=await Navigator.push(context, MaterialPageRoute(builder: (context)=>CityScreen()));
                       print(typedName);
                       if(typedName!=null)
                       {
                           var getweatherName=await weatherModel.getCityWeather(typedName);
                           updateUI(getweatherName);
                           
                       }
                    },
                    child: Icon(
                      Icons.location_city,color: Colors.grey[300],
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text(
                      '$temprature',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherDecription in $cityName",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
