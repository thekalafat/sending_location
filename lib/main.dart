import 'package:flutter/material.dart';

import 'package:sending_location/screens/launcher_screen.dart';

void main() => runApp(ContactsExampleApp());

class ContactsExampleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LauncherScreen(),
    );
  }
}




