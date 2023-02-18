class getProfile {
  Application? application;
  User? user;

  getProfile({this.application, this.user});

  getProfile.fromJson(Map<String, dynamic> json) {
    application = json['application'] != null
        ? new Application.fromJson(json['application'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.application != null) {
      data['application'] = this.application!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Application {
  List<AcademicTests>? academicTests;
  List<Awards>? awards;
  CheckedSteps? checkedSteps;
  List<Educations>? educations;
  List<Languages>? languages;
  List<Licences>? licences;
  List<Researches>? researches;
  List<Skills>? skills;
  List<WorkExperiences>? workExperiences;

  Application(
      {this.academicTests,
      this.awards,
      this.checkedSteps,
      this.educations,
      this.languages,
      this.licences,
      this.researches,
      this.skills,
      this.workExperiences});

  Application.fromJson(Map<String, dynamic> json) {
    if (json['academic_tests'] != null) {
      academicTests = <AcademicTests>[];
      json['academic_tests'].forEach((v) {
        academicTests!.add(new AcademicTests.fromJson(v));
      });
    }
    if (json['awards'] != null) {
      awards = <Awards>[];
      json['awards'].forEach((v) {
        awards!.add(new Awards.fromJson(v));
      });
    }
    checkedSteps = json['checked_steps'] != null
        ? new CheckedSteps.fromJson(json['checked_steps'])
        : null;
    if (json['educations'] != null) {
      educations = <Educations>[];
      json['educations'].forEach((v) {
        educations!.add(new Educations.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(new Languages.fromJson(v));
      });
    }
    if (json['licences'] != null) {
      licences = <Licences>[];
      json['licences'].forEach((v) {
        licences!.add(new Licences.fromJson(v));
      });
    }
    if (json['researches'] != null) {
      researches = <Researches>[];
      json['researches'].forEach((v) {
        researches!.add(new Researches.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['work_experiences'] != null) {
      workExperiences = <WorkExperiences>[];
      json['work_experiences'].forEach((v) {
        workExperiences!.add(new WorkExperiences.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.academicTests != null) {
      data['academic_tests'] =
          this.academicTests!.map((v) => v.toJson()).toList();
    }
    if (this.awards != null) {
      data['awards'] = this.awards!.map((v) => v.toJson()).toList();
    }
    if (this.checkedSteps != null) {
      data['checked_steps'] = this.checkedSteps!.toJson();
    }
    if (this.educations != null) {
      data['educations'] = this.educations!.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    if (this.licences != null) {
      data['licences'] = this.licences!.map((v) => v.toJson()).toList();
    }
    if (this.researches != null) {
      data['researches'] = this.researches!.map((v) => v.toJson()).toList();
    }
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    if (this.workExperiences != null) {
      data['work_experiences'] =
          this.workExperiences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AcademicTests {
  int? applicantId;
  int? id;
  String? organization;
  String? pdfUrl;
  int? score;
  String? testName;

  AcademicTests(
      {this.applicantId,
      this.id,
      this.organization,
      this.pdfUrl,
      this.score,
      this.testName});

  AcademicTests.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    id = json['id'];
    organization = json['organization'];
    pdfUrl = json['pdf_url'];
    score = json['score'];
    testName = json['test_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_id'] = this.applicantId;
    data['id'] = this.id;
    data['organization'] = this.organization;
    data['pdf_url'] = this.pdfUrl;
    data['score'] = this.score;
    data['test_name'] = this.testName;
    return data;
  }
}

class Awards {
  int? applicantId;
  String? awardName;
  int? id;
  String? organization;
  String? pdfUrl;

  Awards(
      {this.applicantId,
      this.awardName,
      this.id,
      this.organization,
      this.pdfUrl});

  Awards.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    awardName = json['award_name'];
    id = json['id'];
    organization = json['organization'];
    pdfUrl = json['pdf_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_id'] = this.applicantId;
    data['award_name'] = this.awardName;
    data['id'] = this.id;
    data['organization'] = this.organization;
    data['pdf_url'] = this.pdfUrl;
    return data;
  }
}

class CheckedSteps {
  bool? academicTest;
  int? applicantId;
  bool? award;
  bool? education;
  bool? generalInfo;
  int? id;
  bool? licencesCertificate;
  bool? research;
  bool? work;

  CheckedSteps(
      {this.academicTest,
      this.applicantId,
      this.award,
      this.education,
      this.generalInfo,
      this.id,
      this.licencesCertificate,
      this.research,
      this.work});

  CheckedSteps.fromJson(Map<String, dynamic> json) {
    academicTest = json['academic_test'];
    applicantId = json['applicant_id'];
    award = json['award'];
    education = json['education'];
    generalInfo = json['general_info'];
    id = json['id'];
    licencesCertificate = json['licences_certificate'];
    research = json['research'];
    work = json['work'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['academic_test'] = this.academicTest;
    data['applicant_id'] = this.applicantId;
    data['award'] = this.award;
    data['education'] = this.education;
    data['general_info'] = this.generalInfo;
    data['id'] = this.id;
    data['licences_certificate'] = this.licencesCertificate;
    data['research'] = this.research;
    data['work'] = this.work;
    return data;
  }
}

class Educations {
  int? applicantGrade;
  int? applicantId;
  String? degreeLevel;
  String? degreeName;
  String? endYear;
  int? id;
  int? maxGrade;
  String? pdfUrl;
  String? startYear;
  String? university;

  Educations(
      {this.applicantGrade,
      this.applicantId,
      this.degreeLevel,
      this.degreeName,
      this.endYear,
      this.id,
      this.maxGrade,
      this.pdfUrl,
      this.startYear,
      this.university});

  Educations.fromJson(Map<String, dynamic> json) {
    applicantGrade = json['applicant_grade'];
    applicantId = json['applicant_id'];
    degreeLevel = json['degree_level'];
    degreeName = json['degree_name'];
    endYear = json['end_year'];
    id = json['id'];
    maxGrade = json['max_grade'];
    pdfUrl = json['pdf_url'];
    startYear = json['start_year'];
    university = json['university'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_grade'] = this.applicantGrade;
    data['applicant_id'] = this.applicantId;
    data['degree_level'] = this.degreeLevel;
    data['degree_name'] = this.degreeName;
    data['end_year'] = this.endYear;
    data['id'] = this.id;
    data['max_grade'] = this.maxGrade;
    data['pdf_url'] = this.pdfUrl;
    data['start_year'] = this.startYear;
    data['university'] = this.university;
    return data;
  }
}

class Languages {
  int? applicantId;
  int? id;
  String? language;
  String? level;

  Languages({this.applicantId, this.id, this.language, this.level});

  Languages.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    id = json['id'];
    language = json['language'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_id'] = this.applicantId;
    data['id'] = this.id;
    data['language'] = this.language;
    data['level'] = this.level;
    return data;
  }
}

class Licences {
  int? applicantId;
  int? id;
  String? licenceName;
  String? organization;
  String? pdfUrl;

  Licences(
      {this.applicantId,
      this.id,
      this.licenceName,
      this.organization,
      this.pdfUrl});

  Licences.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    id = json['id'];
    licenceName = json['licence_name'];
    organization = json['organization'];
    pdfUrl = json['pdf_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_id'] = this.applicantId;
    data['id'] = this.id;
    data['licence_name'] = this.licenceName;
    data['organization'] = this.organization;
    data['pdf_url'] = this.pdfUrl;
    return data;
  }
}

class Researches {
  int? applicantId;
  String? description;
  int? id;
  String? organizationName;
  String? position;
  String? superviser;
  String? superviserEmail;

  Researches(
      {this.applicantId,
      this.description,
      this.id,
      this.organizationName,
      this.position,
      this.superviser,
      this.superviserEmail});

  Researches.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    description = json['description'];
    id = json['id'];
    organizationName = json['organization_name'];
    position = json['position'];
    superviser = json['superviser'];
    superviserEmail = json['superviser_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_id'] = this.applicantId;
    data['description'] = this.description;
    data['id'] = this.id;
    data['organization_name'] = this.organizationName;
    data['position'] = this.position;
    data['superviser'] = this.superviser;
    data['superviser_email'] = this.superviserEmail;
    return data;
  }
}

class Skills {
  int? applicantId;
  int? id;
  String? skill;

  Skills({this.applicantId, this.id, this.skill});

  Skills.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    id = json['id'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_id'] = this.applicantId;
    data['id'] = this.id;
    data['skill'] = this.skill;
    return data;
  }
}

class WorkExperiences {
  int? applicantId;
  String? companyName;
  String? companyWebsite;
  String? description;
  String? employmentType;
  String? endMonth;
  String? endYear;
  int? id;
  String? startMonth;
  String? startYear;
  String? workPosition;

  WorkExperiences(
      {this.applicantId,
      this.companyName,
      this.companyWebsite,
      this.description,
      this.employmentType,
      this.endMonth,
      this.endYear,
      this.id,
      this.startMonth,
      this.startYear,
      this.workPosition});

  WorkExperiences.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    companyName = json['company_name'];
    companyWebsite = json['company_website'];
    description = json['description'];
    employmentType = json['employment_type'];
    endMonth = json['end_month'];
    endYear = json['end_year'];
    id = json['id'];
    startMonth = json['start_month'];
    startYear = json['start_year'];
    workPosition = json['work_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_id'] = this.applicantId;
    data['company_name'] = this.companyName;
    data['company_website'] = this.companyWebsite;
    data['description'] = this.description;
    data['employment_type'] = this.employmentType;
    data['end_month'] = this.endMonth;
    data['end_year'] = this.endYear;
    data['id'] = this.id;
    data['start_month'] = this.startMonth;
    data['start_year'] = this.startYear;
    data['work_position'] = this.workPosition;
    return data;
  }
}

class User {
  String? bio;
  List<BlockedOrganizations>? blockedOrganizations;
  String? city;
  String? country;
  String? dateOfBirth;
  String? email;
  String? fullName;
  int? id;
  String? imageUrl;
  bool? invisibleAge;
  String? lang;
  String? lastStep;
  String? phoneNumber;
  String? profession;
  String? role;
  List<SocialMedias>? socialMedias;

  User(
      {this.bio,
      this.blockedOrganizations,
      this.city,
      this.country,
      this.dateOfBirth,
      this.email,
      this.fullName,
      this.id,
      this.imageUrl,
      this.invisibleAge,
      this.lang,
      this.lastStep,
      this.phoneNumber,
      this.profession,
      this.role,
      this.socialMedias});

  User.fromJson(Map<String, dynamic> json) {
    bio = json['bio'];
    if (json['blocked_organizations'] != null) {
      blockedOrganizations = <BlockedOrganizations>[];
      json['blocked_organizations'].forEach((v) {
        blockedOrganizations!.add(new BlockedOrganizations.fromJson(v));
      });
    }
    city = json['city'];
    country = json['country'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    fullName = json['full_name'];
    id = json['id'];
    imageUrl = json['image_url'];
    invisibleAge = json['invisible_age'];
    lang = json['lang'];
    lastStep = json['last_step'];
    phoneNumber = json['phone_number'];
    profession = json['profession'];
    role = json['role'];
    if (json['social_medias'] != null) {
      socialMedias = <SocialMedias>[];
      json['social_medias'].forEach((v) {
        socialMedias!.add(new SocialMedias.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bio'] = this.bio;
    if (this.blockedOrganizations != null) {
      data['blocked_organizations'] =
          this.blockedOrganizations!.map((v) => v.toJson()).toList();
    }
    data['city'] = this.city;
    data['country'] = this.country;
    data['date_of_birth'] = this.dateOfBirth;
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['invisible_age'] = this.invisibleAge;
    data['lang'] = this.lang;
    data['last_step'] = this.lastStep;
    data['phone_number'] = this.phoneNumber;
    data['profession'] = this.profession;
    data['role'] = this.role;
    if (this.socialMedias != null) {
      data['social_medias'] =
          this.socialMedias!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BlockedOrganizations {
  int? applicantId;
  int? companyId;
  CompanyInfo? companyInfo;
  String? createdAt;
  int? id;

  BlockedOrganizations(
      {this.applicantId,
      this.companyId,
      this.companyInfo,
      this.createdAt,
      this.id});

  BlockedOrganizations.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    companyId = json['company_id'];
    companyInfo = json['company_info'] != null
        ? new CompanyInfo.fromJson(json['company_info'])
        : null;
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_id'] = this.applicantId;
    data['company_id'] = this.companyId;
    if (this.companyInfo != null) {
      data['company_info'] = this.companyInfo!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class CompanyInfo {
  String? city;
  String? companyName;
  String? country;
  String? createdAt;
  String? description;
  String? email;
  String? imageUrl;
  String? phoneNumber;
  String? workersCount;

  CompanyInfo(
      {this.city,
      this.companyName,
      this.country,
      this.createdAt,
      this.description,
      this.email,
      this.imageUrl,
      this.phoneNumber,
      this.workersCount});

  CompanyInfo.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    companyName = json['company_name'];
    country = json['country'];
    createdAt = json['created_at'];
    description = json['description'];
    email = json['email'];
    imageUrl = json['image_url'];
    phoneNumber = json['phone_number'];
    workersCount = json['workers_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['company_name'] = this.companyName;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['email'] = this.email;
    data['image_url'] = this.imageUrl;
    data['phone_number'] = this.phoneNumber;
    data['workers_count'] = this.workersCount;
    return data;
  }
}

class SocialMedias {
  int? applicantId;
  int? id;
  String? name;
  String? url;

  SocialMedias({this.applicantId, this.id, this.name, this.url});

  SocialMedias.fromJson(Map<String, dynamic> json) {
    applicantId = json['applicant_id'];
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_id'] = this.applicantId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
