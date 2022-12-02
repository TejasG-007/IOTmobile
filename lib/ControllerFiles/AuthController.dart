import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iotmobile/Model/CheckSlot.dart';
import 'package:iotmobile/Model/UserModel.dart';

import '../Model/SlotData.dart';

class AuthController extends GetxController{
  
  static AuthController instance = Get.find();
  
  late Rx<User?> user;
  
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore storage = FirebaseFirestore.instance;

@override
  void onReady() {
    super.onReady();
    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());
    ever(user,_initialScreen);
  }
  
  _initialScreen(User? user)async{
  if(user==null){
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed("/login");
  }else{
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/dashboard');
  }
  }


  Future<bool> signInwithEmailandPassword(String email, String password )async{
    try{
      UserCredential userCredential =  await auth.signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      String  userid = user!.uid;
      print(userid);
      return userid!=null?true:false;
    }
    catch(e){
      return false;
    }
  }

  Future<bool> checkUserloginornot()async{
    String userid = await auth.currentUser!.uid;
    if(userid!=null){return true;}else{return false;}
  }

  forgotPassword(String email)async{
    try {
      await auth.sendPasswordResetEmail(email: email);
      return true;
    }on FirebaseAuthException{

      return false;

    }catch(e){
      return false;
    }
  }

  SignOut()async{
    await auth.signOut();
  }

  Future<bool> createAccountwithEmailandPassword(String email , String password ,UserDetails details)async{
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      String  userid = user!.uid;
      if(userid!=null){
        await storage.collection("Users").doc(userid).set(details.toMap());
      }
      return true;
    }catch(e){
      return false;
    }
  }


  Future<bool> bookSlot(SlotData slotData)async{
  try{
  await storage.collection("Users").doc(auth.currentUser?.uid).collection("BookingHistory").add(slotData.toMap()).then((value) =>
      storage.collection("ParkingSlots").doc(slotData.slotNumber).set(
          CheckSlot(slotNumber: slotData.slotNumber,bookedTime: slotData.parkTime).toMap()
      )
  );

    return true;
  }catch(e){
    return false;
  }
  }

  
}