class ApplicationModel {
  int? id;
  String? firstName;
  String? lastName;
  String? speciality;
  String? country;
  String? city;
  String? dateOfBirth;
  bool? invisibleAge;
  String? phoneNumber;
  String? email;
  String? bio;
  String? imageUrl;
  String? lastStep;
  String? createdAt;
  String? updatedAt;

  ApplicationModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.speciality,
        this.country,
        this.city,
        this.dateOfBirth,
        this.invisibleAge,
        this.phoneNumber,
        this.email,
        this.bio,
        this.imageUrl,
        this.lastStep,
        this.createdAt,
        this.updatedAt});

  ApplicationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    speciality = json['speciality'];
    country = json['country'];
    city = json['city'];
    dateOfBirth = json['date_of_birth'];
    invisibleAge = json['invisible_age'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    bio = json['bio'];
    imageUrl = json['image_url'];
    lastStep = json['last_step'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['speciality'] = speciality;
    data['country'] = country;
    data['city'] = city;
    data['date_of_birth'] = dateOfBirth;
    data['invisible_age'] = invisibleAge;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['bio'] = bio;
    data['image_url'] = imageUrl;
    data['last_step'] = lastStep;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}