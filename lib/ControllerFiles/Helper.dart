import 'package:get/get.dart';

class StateHelper extends GetxController{
  var isPasswordHidden = true.obs;

  ShowPassword(){
    isPasswordHidden.value = !(isPasswordHidden.value);
  }

  var SlotData = {
    "Slot-1":{
      "isBooked":true,
      "isAvailable":false,
      "Booked-by-user-id":"",
      "booked-time":"",
    },"Slot-2":{
      "isBooked":false,
      "isAvailable":true,
      "Booked-by-user-id":"",
      "booked-time":"",
    },"Slot-3":{
      "isBooked":true,
      "isAvailable":false,
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

}