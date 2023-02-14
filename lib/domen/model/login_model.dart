class LoginModel {
  String? accessToken;
  String? refreshToken;
  Application? application;
  User? user;

  LoginModel(
      {this.accessToken, this.refreshToken, this.application, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    application = json['application'] != null
        ? Application.fromJson(json['application'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    if (application != null) {
      data['application'] = application!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Application {
  dynamic academicTests;
  dynamic awards;
  CheckedSteps? checkedSteps;
  dynamic educations;
  dynamic languages;
  dynamic licences;
  dynamic researches;
  dynamic skills;

  Application(
      {this.academicTests,
      this.awards,
      this.checkedSteps,
      this.educations,
      this.languages,
      this.licences,
      this.researches,
      this.skills});

  Application.fromJson(Map<String, dynamic> json) {
    academicTests = json['academic_tests'];
    awards = json['awards'];
    checkedSteps = json['checked_steps'] != null
        ? CheckedSteps.fromJson(json['checked_steps'])
        : null;
    educations = json['educations'];
    languages = json['languages'];
    licences = json['licences'];
    researches = json['researches'];
    skills = json['skills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['academic_tests'] = academicTests;
    data['awards'] = awards;
    if (checkedSteps != null) {
      data['checked_steps'] = checkedSteps!.toJson();
    }
    data['educations'] = educations;
    data['languages'] = languages;
    data['licences'] = licences;
    data['researches'] = researches;
    data['skills'] = skills;
    return data;
  }
}

class CheckedSteps {
  int? id;
  int? applicantId;
  bool? generalInfo;
  bool? work;
  bool? education;
  bool? academicTest;
  bool? licencesCertificate;
  bool? award;
  bool? research;

  CheckedSteps(
      {this.id,
      this.applicantId,
      this.generalInfo,
      this.work,
      this.education,
      this.academicTest,
      this.licencesCertificate,
      this.award,
      this.research});

  CheckedSteps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    applicantId = json['applicant_id'];
    generalInfo = json['general_info'];
    work = json['work'];
    education = json['education'];
    academicTest = json['academic_test'];
    licencesCertificate = json['licences_certificate'];
    award = json['award'];
    research = json['research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['applicant_id'] = applicantId;
    data['general_info'] = generalInfo;
    data['work'] = work;
    data['education'] = education;
    data['academic_test'] = academicTest;
    data['licences_certificate'] = licencesCertificate;
    data['award'] = award;
    data['research'] = research;
    return data;
  }
}

class User {
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
  dynamic phoneNumber;
  String? profession;
  String? role;
  dynamic imageUrl;
  dynamic socialMedias;
  dynamic blockedOrganizations;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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