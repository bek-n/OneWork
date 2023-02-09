class ProfileModel {
  int? id;
  String? fullName;
  String? bio;
  String? lang;
  String? lastStep;
  String? dateOfBirth;
  String? email;
  bool? invisibleAge;
  String? city;
  String? country;
  num? phoneNumber;
  String? profession;
  String? role;
  String? imageUrl;
  dynamic socialMedias;
  dynamic blockedOrganizations;

  ProfileModel(
      {this.id,
        this.fullName,
        this.bio,
        this.lang,
        this.lastStep,
        this.dateOfBirth,
        this.email,
        this.invisibleAge,
        this.city,
        this.country,
        this.phoneNumber,
        this.profession,
        this.role,
        this.imageUrl,
        this.socialMedias,
        this.blockedOrganizations});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    bio = json['bio'];
    lang = json['lang'];
    lastStep = json['last_step'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    invisibleAge = json['invisible_age'];
    city = json['city'];
    country = json['country'];
    phoneNumber = json['phone_number'];
    profession = json['profession'];
    role = json['role'];
    imageUrl = json['image_url'];
    socialMedias = json['social_medias'];
    blockedOrganizations = json['blocked_organizations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['bio'] = bio;
    data['lang'] = lang;
    data['last_step'] = lastStep;
    data['date_of_birth'] = dateOfBirth;
    data['email'] = email;
    data['invisible_age'] = invisibleAge;
    data['city'] = city;
    data['country'] = country;
    data['phone_number'] = phoneNumber;
    data['profession'] = profession;
    data['role'] = role;
    data['image_url'] = imageUrl;
    data['social_medias'] = socialMedias;
    data['blocked_organizations'] = blockedOrganizations;
    return data;
  }
}