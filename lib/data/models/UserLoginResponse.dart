/// user : {"_id":"6857b137bf0f8ad41e2fd31f","name":"mohamed ahmed","email":"james.francis.byrnes@example-pet-store.com","password":"$2b$10$M.kMOhNG9L9fZqS2j6GwSeUjGTq6IH14kyq6eJT.vfrgjoi7vHaQC","phoneNumber":"01012345678","classes":[],"visa":[],"__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NTdiMTM3YmYwZjhhZDQxZTJmZDMxZiIsImlhdCI6MTc1MDU3ODA4OCwiZXhwIjoxNzUwNTgxNjg4fQ.fUt7j38pL5yDmGIH37kda8Rb4t3y-N2qJpUbQ7I1DLM"

class UserLoginResponse {
  UserLoginResponse({this.user, this.token, this.message});

  UserLoginResponse.fromJson(dynamic json) {
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

/// _id : "6857b137bf0f8ad41e2fd31f"
/// name : "mohamed ahmed"
/// email : "james.francis.byrnes@example-pet-store.com"
/// password : "$2b$10$M.kMOhNG9L9fZqS2j6GwSeUjGTq6IH14kyq6eJT.vfrgjoi7vHaQC"
/// phoneNumber : "01012345678"
/// classes : []
/// visa : []
/// __v : 0

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.classes,
    this.visa,
    this.v,
  });

  User.fromJson(dynamic json) {
    id = json['_id'];
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
    // if (json['visa'] != null) {
    //   visa = [];
    //   json['visa'].forEach((v) {
    //     visa?.add(Dynamic.fromJson(v));
    //   });
    // }
    v = json['__v'];
  }

  String? id;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  List<dynamic>? classes;
  List<dynamic>? visa;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phoneNumber'] = phoneNumber;
    if (classes != null) {
      map['classes'] = classes?.map((v) => v.toJson()).toList();
    }
    if (visa != null) {
      map['visa'] = visa?.map((v) => v.toJson()).toList();
    }
    map['__v'] = v;
    return map;
  }
}
