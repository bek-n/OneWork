class EditUserModel {
  int? id;
  String? bio;
  String? city;
  String? country;
  String? dateOfBirth;
  String? firstName;
  String? imageUrl;
  bool? invisibleAge;
  String? lastName;
  String? phoneNumber;
  String? speciality;

  EditUserModel({
    this.bio,
    this.city,
    this.country,
    this.dateOfBirth,
    this.firstName,
    this.imageUrl,
    this.invisibleAge,
    this.lastName,
    this.phoneNumber,
    this.speciality,
     this.id,
  });

  EditUserModel.fromJson(Map<String, dynamic> json) {
    bio = json['bio'];
    city = json['city'];
    country = json['country'];
    dateOfBirth = json['date_of_birth'];
    firstName = json['first_name'];
    imageUrl = json['image_url'];
    invisibleAge = json['invisible_age'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    speciality = json['speciality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bio'] = bio;
    data['city'] = city;
    data['country'] = country;
    data['date_of_birth'] = dateOfBirth;
    data['first_name'] = firstName;
    data['image_url'] = imageUrl;
    data['invisible_age'] = invisibleAge;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['speciality'] = speciality;
    return data;
  }
}