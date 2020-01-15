import 'package:geolocator/geolocator.dart';

class Location{

  double latitude;
  double longitude;

  //Bulunduğumuz konumu latitude(enlem) ve longitude(boylam) olarak bize bulduran fonksiyon
  Future<void> getCurrentLocation () async{
    try{

      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e){
      print(e);
    }


  }


}