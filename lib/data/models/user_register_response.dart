/// user : {"name":"Marwan Reda","email":"ma5853505@gmail.com","password":"$2b$10$CnGeWBfCP92fFEyiJOp/POB9HzufGOT4kG0J6sfMkP/UOXOSaKeJm","phoneNumber":"+01559974341","classes":[],"_id":"685766aaa29b43854eea97bb","visa":[],"__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NTc2NmFhYTI5YjQzODU0ZWVhOTdiYiIsImlhdCI6MTc1MDU1ODM3OCwiZXhwIjoxNzUwNTYxOTc4fQ.AUkA_IgBnxPkqE0ROzTkzGw2PGnR9OvPdZ-6LN_W08E"

class UserRegisterResponse {
  UserRegisterResponse({
    this.user,
    this.token,
    this.message,
  });

  UserRegisterResponse.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  User? user;
  String? token;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    map['message'] = message;
    return map;
  }
}

/// name : "Marwan Reda"
/// email : "ma5853505@gmail.com"
/// password : "$2b$10$CnGeWBfCP92fFEyiJOp/POB9HzufGOT4kG0J6sfMkP/UOXOSaKeJm"
/// phoneNumber : "+01559974341"
/// classes : []
/// _id : "685766aaa29b43854eea97bb"
/// visa : []
/// __v : 0

class User {
  User({
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.classes,
    this.id,
    this.visa,
    this.v,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    // if (json['classes'] != null) {
    //   classes = [];
    //   json['classes'].forEach((v) {
    //     classes?.add(Dynamic.fromJson(v));
    //   });
    // }
    id = json['_id'];
    // if (json['visa'] != null) {
    //   visa = [];
    //   json['visa'].forEach((v) {
    //     visa?.add(Dynamic.fromJson(v));
    //   });
    // }
    v = json['__v'];
  }

  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  List<dynamic>? classes;
  String? id;
  List<dynamic>? visa;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phoneNumber'] = phoneNumber;
    if (classes != null) {
      map['classes'] = classes?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    if (visa != null) {
      map['visa'] = visa?.map((v) => v.toJson()).toList();
    }
    map['__v'] = v;
    return map;
  }
}
