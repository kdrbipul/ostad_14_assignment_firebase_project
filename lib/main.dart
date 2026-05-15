import 'package:firebase/firebase.dart' as Firebase;
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}



