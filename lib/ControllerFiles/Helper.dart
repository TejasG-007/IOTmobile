import 'package:get/get.dart';

class StateHelper extends GetxController{

 final userloggedin = false.obs;


  var isPasswordHidden = true.obs;
  final isButtonDisabled = false.obs;

  ShowPassword(){
    isPasswordHidden.value = !(isPasswordHidden.value);
  }

  makeButtonDisabled(){
    isButtonDisabled.value = true;
  }
  makeButtonEnabled(){
    isButtonDisabled.value = false;
  }

  var SlotData = {
    "Slot-1":{
      "isBooked":false,
      "isAvailable":true,
      "Booked-by-user-id":"",
      "booked-time":"",
    },"Slot-2":{
      "isBooked":false,
      "isAvailable":true,
      "Booked-by-user-id":"",
      "booked-time":"",
    },"Slot-3":{
      "isBooked":false,
      "isAvailable":true,
      "Booked-by-user-id":"",
      "booked-time":"",
    },
  }.obs;

  UpdateSlotData(slot_name,slot_data){
    SlotData[slot_name]=slot_data;
  }

  bool GetisBooked(Slotno){
    return SlotData[Slotno]?["isBooked"] as bool;
  }

  bool GetisAvailable(Slotno){
    return SlotData[Slotno]?["isAvailable"] as bool;
  }


  ////////////////////////----------buffer timing

  RxString bufferTime = "1".obs;
  RxString bufferPrice = "2.75".obs;
  RxString parkingTime = "02:00".obs;
  RxString parkingPrice = "1".obs;
  RxString parkingDuration = "1".obs;
  RxString earliarParkingTime = "02:00".obs;



}

