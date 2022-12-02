import 'package:get/get.dart';
import 'package:iotmobile/Views/CreateAccount.dart';
import 'package:iotmobile/Views/ForgotPassword.dart';
import 'package:iotmobile/Views/LoginView.dart';
import 'package:iotmobile/Views/SplashScreen.dart';
import '../Views/DashBoard.dart';



appRoutes()=>[
  GetPage(name: '/dashboard', page:()=>DashBoardScreen(),
  transition: Transition.leftToRightWithFade),
  GetPage(name: '/login', page:()=>LoginScreen(),
  transition: Transition.fadeIn),
  GetPage(name: '/createAccount', page:()=>CreateAccount(),
      transition: Transition.fadeIn),
  GetPage(name: '/forgotPassword', page:()=>ForgotPassword(),
      transition: Transition.native),
  GetPage(name: '/splash', page:()=>SplashScreen(),
      transition: Transition.fadeIn),

];
