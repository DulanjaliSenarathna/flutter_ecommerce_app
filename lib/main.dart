import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {

  //Initialize firebase
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}
