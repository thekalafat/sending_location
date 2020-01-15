import 'package:flutter/material.dart';

//textcard'ımızın classını oluşturduk ve icon için icondata,color için color ve text için string tipinde
//tanımladık
class TextCard extends StatelessWidget {

  IconData _icon;
  Color _color;
  String _text;

  //textcard'ımızın yapıcı(constructor) fonksiyonunu ikon,renk ve text olarak verdik
  TextCard(this._icon, this._color, this._text);

  //oluşturduğumuz Card'ın özelliklerini renk,kenar olarak oluşturduk
  Widget build(BuildContext context) {
    return
      Card(
          color: Colors.white54,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child:ListTile(
              leading: Icon(_icon,color: _color),
              title:Text(_text)
          ),
      );
  }
}