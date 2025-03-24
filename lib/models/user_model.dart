class UserModel {
  final String? id;
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profession;
  final String? workExperience;
  final String? hourlyRate;
  final String? shopNumber;
  final String? profilePhotoUrl;
  final bool isWorker;

  UserModel({
    this.id,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.email,
    this.profession,
    this.workExperience,
    this.hourlyRate,
    this.shopNumber,
    this.profilePhotoUrl,
    this.isWorker = false,
  });

  UserModel copyWith({
    String? id,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? email,
    String? profession,
    String? workExperience,
    String? hourlyRate,
    String? shopNumber,
    String? profilePhotoUrl,
    bool? isWorker,
  }) {
    return UserModel(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      profession: profession ?? this.profession,
      workExperience: workExperience ?? this.workExperience,
      hourlyRate: hourlyRate ?? this.hourlyRate,
      shopNumber: shopNumber ?? this.shopNumber,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      isWorker: isWorker ?? this.isWorker,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profession': profession,
      'workExperience': workExperience,
      'hourlyRate': hourlyRate,
      'shopNumber': shopNumber,
      'profilePhotoUrl': profilePhotoUrl,
      'isWorker': isWorker,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      profession: json['profession'],
      workExperience: json['workExperience'],
      hourlyRate: json['hourlyRate'],
      shopNumber: json['shopNumber'],
      profilePhotoUrl: json['profilePhotoUrl'],
      isWorker: json['isWorker'] ?? false,
    );
  }
}
