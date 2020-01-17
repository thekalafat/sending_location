import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:sending_location/components/ItemsTile.dart';
import 'package:sending_location/components/TextCard.dart';
import 'package:flutter_sms/flutter_sms.dart';


class sending_sms extends StatelessWidget {

  double latitude;
  double longitude;
  String displayName;
  Iterable<Item> phones;


  sending_sms(this.latitude,this.longitude,this.displayName,this.phones);

  void getPhones (){

    List<String> tel = [];

    this.phones.map((i) =>
        tel.add(i.value)
    ).toList();

      this._sendSMS("https://www.google.com/maps/search/?api=1&query="+this.latitude.toString()+","+this.longitude.toString(),tel);

  }

  //sms atma fonksiyonu message olarak konum bilgisini alıyor
  void _sendSMS(String message, List<String> recipents) async {
    String _result = await FlutterSms
        .sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(displayName),
      ),
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            ItemsTile(Icons.phone, Colors.red, phones), //telefon kartını oluşturan fonksiyon

            TextCard(Icons.location_on,Colors.red,""+latitude.toString()+" , "+longitude.toString()), //enlem,boylam gösteren fonksiyon


          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          this.getPhones();
        },
        label: Text('Share my location'),
        icon: Icon(Icons.send),
        backgroundColor: Colors.pink,
      ),
    );
  }
}





/* ICON BUTTON OLURSA
Container(
             child: IconButton(
                icon: Icon(Icons.send),
                color : Colors.red,
                tooltip: 'Send SMS',
                onPressed: () {
                  this.getPhones();
                },
              ),
            ),
            Text('Send')
 */