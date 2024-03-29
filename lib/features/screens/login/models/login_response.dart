// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

class LoginResponse {
  final bool? status;
  final String? message;
  final Data? data;

  LoginResponse({
    this.status,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final String? token;
  final String? tokenType;
  final User? user;

  Data({
    this.token,
    this.tokenType,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        tokenType: json["token_type"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "user": user?.toJson(),
      };
}

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? email;
  final String? phoneIso;
  final String? phoneNumber;
  final dynamic fullPhoneNo;
  final String? profileStatus;
  final String? accountStatus;
  final String? userType;
  final DateTime? dateOfBirth;
  final Profile? profile;
  final Settings? settings;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.phoneIso,
    this.phoneNumber,
    this.fullPhoneNo,
    this.profileStatus,
    this.accountStatus,
    this.userType,
    this.dateOfBirth,
    this.profile,
    this.settings,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fullName: json["full_name"],
        email: json["email"],
        phoneIso: json["phone_iso"],
        phoneNumber: json["phone_number"],
        fullPhoneNo: json["full_phone_no"],
        profileStatus: json["profile_status"],
        accountStatus: json["account_status"],
        userType: json["user_type"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        settings: json["settings"] == null
            ? null
            : Settings.fromJson(json["settings"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "full_name": fullName,
        "email": email,
        "phone_iso": phoneIso,
        "phone_number": phoneNumber,
        "full_phone_no": fullPhoneNo,
        "profile_status": profileStatus,
        "account_status": accountStatus,
        "user_type": userType,
        "date_of_birth": dateOfBirth?.toIso8601String(),
        "profile": profile?.toJson(),
        "settings": settings?.toJson(),
      };
}

class Profile {
  final int? userId;
  final dynamic age;
  final String? gender;
  final double? height;
  final String? heightUnit;
  final dynamic weight;
  final dynamic weightUnit;
  final String? hairColor;
  final String? eyeColor;
  final String? smokeHabit;
  final String? drinkHabit;
  final Location? location;
  final String? bio;
  final dynamic ethnicityId;
  final List<String>? passions;
  final dynamic religion;
  final dynamic hometown;
  final dynamic children;
  final bool? politicanInterest;
  final int? educationInstituteId;

  Profile({
    this.userId,
    this.age,
    this.gender,
    this.height,
    this.heightUnit,
    this.weight,
    this.weightUnit,
    this.hairColor,
    this.eyeColor,
    this.smokeHabit,
    this.drinkHabit,
    this.location,
    this.bio,
    this.ethnicityId,
    this.passions,
    this.religion,
    this.hometown,
    this.children,
    this.politicanInterest,
    this.educationInstituteId,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        userId: json["user_id"],
        age: json["age"],
        gender: json["gender"],
        height: double.tryParse(json["height"].toString()),
        heightUnit: json["height_unit"],
        weight: json["weight"],
        weightUnit: json["weight_unit"],
        hairColor: json["hair_color"],
        eyeColor: json["eye_color"],
        smokeHabit: json["smoke_habit"],
        drinkHabit: json["drink_habit"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        bio: json["bio"],
        ethnicityId: json["ethnicity_id"],
        passions: json["passions"] == null
            ? []
            : List<String>.from(json["passions"]!.map((x) => x)),
        religion: json["religion"],
        hometown: json["hometown"],
        children: json["children"],
        politicanInterest: json["politican_interest"],
        educationInstituteId: json["education_institute_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "age": age,
        "gender": gender,
        "height": height,
        "height_unit": heightUnit,
        "weight": weight,
        "weight_unit": weightUnit,
        "hair_color": hairColor,
        "eye_color": eyeColor,
        "smoke_habit": smokeHabit,
        "drink_habit": drinkHabit,
        "location": location?.toJson(),
        "bio": bio,
        "ethnicity_id": ethnicityId,
        "passions":
            passions == null ? [] : List<dynamic>.from(passions!.map((x) => x)),
        "religion": religion,
        "hometown": hometown,
        "children": children,
        "politican_interest": politicanInterest,
        "education_institute_id": educationInstituteId,
      };
}

class Location {
  final String? type;
  final List<double>? coordinates;

  Location({
    this.type,
    this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
      };
}

class Settings {
  final int? userId;
  final String? language;
  final bool? notification;

  Settings({
    this.userId,
    this.language,
    this.notification,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        userId: json["user_id"],
        language: json["language"],
        notification: json["notification"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "language": language,
        "notification": notification,
      };
}
