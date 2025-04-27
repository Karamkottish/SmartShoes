import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_shoes/Data/Models.dart';

class FirebaseModel {
  String uid;

  FirebaseModel(this.uid);

  DocumentReference<Map<String, dynamic>> get userInfo =>
      FirebaseFirestore.instance.collection("userInfo").doc(uid);

  DocumentReference<Map<String, dynamic>> get userLegSensors =>
      FirebaseFirestore.instance.collection("legsSensors").doc(uid);

  DocumentReference<Map<String, dynamic>> get userFeetSensors =>
      FirebaseFirestore.instance.collection("feetSensors").doc(uid);

  Future updateUserData(Map<String, dynamic> data) async {
    await userInfo.update(data);
  }



  Future setUserLegsSensors(LegsSensorsModel legsSensors) async{
    await userLegSensors.set(legsSensors.toJson());
  }

  Future<LegsSensorsModel> getUserLegSensors() async {
    var legSnapshot = (await userLegSensors.get()).data();
    return legSnapshot != null
        ? LegsSensorsModel(
            legSnapshot["LTO"],
            legSnapshot["LTH"],
            legSnapshot["LLO"],
            legSnapshot["LLH"],
            legSnapshot["LFO"],
            legSnapshot["LFH"],
            legSnapshot["RTO"],
            legSnapshot["RTH"],
            legSnapshot["RLO"],
            legSnapshot["RLH"],
            legSnapshot["RFO"],
            legSnapshot["RFH"])
        : LegsSensorsModel(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
  }

  Future<UserModelOld> getUserInfo() async {
    var userSnapshot = (await userInfo.get()).data();
    return userSnapshot != null
        ? UserModelOld(
            userSnapshot["name"],
            userSnapshot["email"],
            userSnapshot["weight"],
            userSnapshot["height"],
            userSnapshot["birthYear"])
        : UserModelOld("Undefined", "Undefined", -1, -1, -1);
  }




  Future<FeetModel> getFeetSensors() async {
    var feetSnapshot = (await userFeetSensors.get()).data();
    return feetSnapshot != null
        ? FeetModel(
            feetSnapshot["R11"],
            feetSnapshot["R12"],
            feetSnapshot["R13"],
            feetSnapshot["R14"],
            feetSnapshot["R21"],
            feetSnapshot["R22"],
            feetSnapshot["R23"],
            feetSnapshot["R24"],
            feetSnapshot["R25"],
            feetSnapshot["R26"],
            feetSnapshot["R31"],
            feetSnapshot["R32"])
        : FeetModel(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
  }

  Future setFeetSensors(FeetModel feet) async{


  }
}
