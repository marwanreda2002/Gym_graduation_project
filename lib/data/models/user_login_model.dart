class UserLoginModel {
  UserLoginModel({
    this.user,
    this.token,
    this.message,
  });

  UserLoginModel.fromJson(dynamic json) {
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
    this.dateOfBirth,
    this.gender,
    this.subscriptionType,
  });

  User.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    classes = json['classes'] != null ? json['classes'].cast<String>() : [];
    // if (json['visa'] != null) {
    //   visa = [];
    //   json['visa'].forEach((v) {
    //     visa?.add(Dynamic.fromJson(v));
    //   });
    // }
    v = json['__v'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    subscriptionType = json['subscriptionType'];
  }

  String? id;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  List<String>? classes;
  List<dynamic>? visa;
  num? v;
  String? dateOfBirth;
  String? gender;
  String? subscriptionType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phoneNumber'] = phoneNumber;
    map['classes'] = classes;
    if (visa != null) {
      map['visa'] = visa?.map((v) => v.toJson()).toList();
    }
    map['__v'] = v;
    map['dateOfBirth'] = dateOfBirth;
    map['gender'] = gender;
    map['subscriptionType'] = subscriptionType;
    return map;
  }
}
