class Person {
  String name;
  String email;
  String password;
  double weight;
  double height;
  double birthYear;
  String image;

  Person(this.name, this.email, this.password, this.weight, this.height,
      this.birthYear,this.image);
  
  factory Person.fromJson (Map<String,dynamic> json) =>
      Person(json["name"], json["email"], json["password"],
          json["weight"],json["height"],json["birthYear"],json["image"]);


  Map<String,dynamic> toJson() => {
    "name" : name,
    "email": email,
    "password": password,
    "weight": weight,
    "height": height,
    "birthYear": birthYear,
    "image" : image
  };
}






class LegsSensorsModel{
  int LTO;
  int LTH;
  int LLO;
  int LLH;
  int LFO;
  int LFH;
  int RTO;
  int RTH;
  int RLO;
  int RLH;
  int RFO;
  int RFH;

  LegsSensorsModel(this.LTO, this.LTH, this.LLO, this.LLH, this.LFO, this.LFH,
      this.RTO, this.RTH, this.RLO, this.RLH, this.RFO,this.RFH);

  Map<String,dynamic> toJson(){
    return {
      "LTO": LTO,
      "LTH": LTH,
      "LLO": LLO,
      "LLH": LLH,
      "LFO": LFO,
      "LFH": LFH,
      "RTO": RTO,
      "RTH":RTH,
      "RLO":RLO,
      "RLH":RLH,
      "RFO":RFO,
      "RFH":RFH
    };
  }
}


class UserModelOld{
  String name;
  String email;
  double weight;
  double height;
  int birthYear;

  UserModelOld(this.name, this.email, this.weight, this.height, this.birthYear);

  Map<String,dynamic> toJson(){
    return {
      "name" : name,
      "email": email,
      "weight": weight,
      "height": height,
      "birthYear": birthYear
    };
  }

}

class FeetModel{
  int R11;
  int R12;
  int R13;
  int R14;
  int R21;
  int R22;
  int R23;
  int R24;
  int R25;
  int R26;
  int R31;
  int R32;

  FeetModel(this.R11, this.R12, this.R13, this.R14, this.R21, this.R22,
      this.R23, this.R24, this.R25, this.R26, this.R31, this.R32);


  Map<String,dynamic> toJson(){
    return {
      "R11": R11,
      "R12": R12,
      "R13": R13,
      "R14": R14,
      "R21": R21,
      "R22": R22,
      "R23": R23,
      "R24": R24,
      "R25": R25,
      "R26": R26,
      "R31": R31,
      "R32": R32
    };
  }
}