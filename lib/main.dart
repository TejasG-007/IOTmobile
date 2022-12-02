import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iotmobile/ControllerFiles/Approutes.dart';
import 'package:iotmobile/ControllerFiles/AuthController.dart';
import 'package:iotmobile/Views/DashBoard.dart';
import 'package:iotmobile/Views/LoginView.dart';
import 'package:iotmobile/Views/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
    const FirebaseOptions(apiKey: "AIzaSyCnLO8QDRTaf5tRUReeu0nWWhlD781PdUo",
        authDomain: "mgmcllgproject.firebaseapp.com",
        projectId: "mgmcllgproject",
        storageBucket: "mgmcllgproject.appspot.com",
        messagingSenderId: "970158820401",
        appId: "1:970158820401:web:585a49e0e50ea44b30d910",
        measurementId: "G-ZY8S6PDHXG")
  ).then((value) => Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: appRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/splash',
    );
  }
}
