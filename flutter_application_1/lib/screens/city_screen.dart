import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration:  InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'search of weather Location',
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    icon: const Icon(Icons.location_city),
                    iconColor: Colors.grey[700],
                    
                  ),
                  onChanged: (val){
                    cityName=val;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                   Navigator.pop(context,cityName);
                },
                child:const  Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                  
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
