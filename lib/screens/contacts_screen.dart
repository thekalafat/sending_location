import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:sending_location/location.dart';
import 'package:sending_location/screens/sending_sms.dart';
import 'package:fluttertoast/fluttertoast.dart';

class contacts_screen extends StatefulWidget {
  @override
  _contacts_screenState createState() => _contacts_screenState();
}

class _contacts_screenState extends State<contacts_screen> {

  Iterable<Contact> _contacts;

  double _latitude;
  double _longitude;

  void getLocation() async {
    Fluttertoast.showToast(
        msg: "Location successfully imported.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.black,
        fontSize: 16.0
    );
    Location location = Location();
    await location.getCurrentLocation();


    this._latitude = location.latitude;
    this._longitude = location.longitude;

    print(location.latitude);
    print(location.longitude);
  }

  //sayfa acıldığında çalışacak olan ilk fonksiyonlarımız
  @override
  initState() {
    super.initState();
    ListContact();
    //getLocation();
  }

  //kişileri getContact metodu ile contacts değişkeninde tutuyor sonra bu contact değişkeninide
  //state'deki _contacts nesnesine atıyor
  ListContact() async {

      var contacts = await ContactsService.getContacts();

      setState(() {
        _contacts = contacts;
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:FloatingActionButton.extended(
          onPressed: () {
            getLocation();
          },
          label: Text('Get Location'),
          icon: Icon(Icons.gps_fixed),
          backgroundColor: Colors.blue,
        ),
      appBar: AppBar(
          title: Text('Share my location by SMS')
      ),

      body: SafeArea(
        child: _contacts != null
            ? ListView.builder(
          itemCount: _contacts?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            Contact c = _contacts?.elementAt(index);
            return ListTile(
              //rehberimizdeki bir kişiye basınca gerçekleşecek olan push animasyon işlemi ve çağırdığımız
              //sending_sms fonksiyonu çalışıyor
              onTap: () {
                if(this._latitude !=null && this._longitude !=null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          sending_sms(
                              this._latitude, this._longitude, c.displayName,
                              c.phones),
                  ),
                  );
                }
                else{
                  Fluttertoast.showToast(
                      msg: "Could not get location information",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.redAccent,
                      textColor: Colors.black,
                      fontSize: 16.0
                  );
                }

              },

              leading: (c.avatar != null && c.avatar.length > 0)
                  ? CircleAvatar(backgroundImage: MemoryImage(c.avatar))
                  : CircleAvatar(child: Text(c.initials())),
              title: Text(c.displayName ?? ""),

            );
          },
        )
            //KİŞİLERE ERİŞİM İZNİ VERİLMEZSE EKRANIN ORTASINDA YUVARLAK DÖNECEK
            : Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
