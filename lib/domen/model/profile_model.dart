// To parse this JSON data, do
//
//     final getProfile = getProfileFromJson(jsonString);

import 'dart:convert';

GetProfile getProfileFromJson(String str) => GetProfile.fromJson(json.decode(str));

String getProfileToJson(GetProfile data) => json.encode(data.toJson());

class GetProfile {
    GetProfile({
         this.application,
         this.user,
    });

    Application? application;
    User? user;

    factory GetProfile.fromJson(Map<String, dynamic> json) => GetProfile(
        application: Application.fromJson(json["application"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "application": application?.toJson(),
        "user": user?.toJson(),
    };
}

class Application {
    Application({
         this.academicTests,
         this.awards,
         this.checkedSteps,
         this.educations,
         this.languages,
        this.licences,
         this.researches,
         this.skills,
         this.workExperiences,
    });

    List<AcademicTest>? academicTests;
    List<Award>? awards;
    CheckedSteps? checkedSteps;
    List<Education>? educations;
    List<Language>? languages;
    List<Award>? licences;
    List<Research>? researches;
    List<Skill>? skills;
    List<WorkExperience>? workExperiences;

    factory Application.fromJson(Map<String, dynamic> json) => Application(
        academicTests: List<AcademicTest>.from(json["academic_tests"].map((x) => AcademicTest.fromJson(x))),
        awards: List<Award>.from(json["awards"].map((x) => Award.fromJson(x))),
        checkedSteps: CheckedSteps.fromJson(json["checked_steps"]),
        educations: List<Education>.from(json["educations"].map((x) => Education.fromJson(x))),
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
        licences: List<Award>.from(json["licences"].map((x) => Award.fromJson(x))),
        researches: List<Research>.from(json["researches"].map((x) => Research.fromJson(x))),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        workExperiences: List<WorkExperience>.from(json["work_experiences"].map((x) => WorkExperience.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "academic_tests": List<dynamic>.from(academicTests!.map((x) => x.toJson())),
        "awards": List<dynamic>.from(awards!.map((x) => x.toJson())),
        "checked_steps": checkedSteps?.toJson(),
        "educations": List<dynamic>.from(educations!.map((x) => x.toJson())),
        "languages": List<dynamic>.from(languages!.map((x) => x.toJson())),
        "licences": List<dynamic>.from(licences!.map((x) => x.toJson())),
        "researches": List<dynamic>.from(researches!.map((x) => x.toJson())),
        "skills": List<dynamic>.from(skills!.map((x) => x.toJson())),
        "work_experiences": List<dynamic>.from(workExperiences!.map((x) => x.toJson())),
    };
}

class AcademicTest {
    AcademicTest({
         this.applicantId,
         this.id,
         this.organization,
         this.pdfUrl,
         this.score,
         this.testName,
    });

    int? applicantId;
    int? id;
    String? organization;
    String? pdfUrl;
    int? score;
    String? testName;

    factory AcademicTest.fromJson(Map<String, dynamic> json) => AcademicTest(
        applicantId: json["applicant_id"],
        id: json["id"],
        organization: json["organization"],
        pdfUrl: json["pdf_url"],
        score: json["score"],
        testName: json["test_name"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "id": id,
        "organization": organization,
        "pdf_url": pdfUrl,
        "score": score,
        "test_name": testName,
    };
}

class Award {
    Award({
        required this.applicantId,
        this.awardName,
        required this.id,
        required this.organization,
        required this.pdfUrl,
        this.licenceName,
    });

    int applicantId;
    String? awardName;
    int id;
    String organization;
    String pdfUrl;
    String? licenceName;

    factory Award.fromJson(Map<String, dynamic> json) => Award(
        applicantId: json["applicant_id"],
        awardName: json["award_name"],
        id: json["id"],
        organization: json["organization"],
        pdfUrl: json["pdf_url"],
        licenceName: json["licence_name"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "award_name": awardName,
        "id": id,
        "organization": organization,
        "pdf_url": pdfUrl,
        "licence_name": licenceName,
    };
}

class CheckedSteps {
    CheckedSteps({
         this.academicTest,
         this.applicantId,
         this.award,
         this.education,
         this.generalInfo,
         this.id,
         this.licencesCertificate,
         this.research,
         this.work,
    });

    bool? academicTest;
    int? applicantId;
    bool? award;
    bool? education;
    bool? generalInfo;
    int? id;
    bool? licencesCertificate;
    bool? research;
    bool? work;

    factory CheckedSteps.fromJson(Map<String, dynamic> json) => CheckedSteps(
        academicTest: json["academic_test"],
        applicantId: json["applicant_id"],
        award: json["award"],
        education: json["education"],
        generalInfo: json["general_info"],
        id: json["id"],
        licencesCertificate: json["licences_certificate"],
        research: json["research"],
        work: json["work"],
    );

    Map<String, dynamic> toJson() => {
        "academic_test": academicTest,
        "applicant_id": applicantId,
        "award": award,
        "education": education,
        "general_info": generalInfo,
        "id": id,
        "licences_certificate": licencesCertificate,
        "research": research,
        "work": work,
    };
}

class Education {
    Education({
         this.applicantGrade,
         this.applicantId,
         this.degreeLevel,
         this.degreeName,
         this.endYear,
         this.id,
         this.maxGrade,
         this.pdfUrl,
         this.startYear,
         this.university,
    });

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

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        applicantGrade: json["applicant_grade"],
        applicantId: json["applicant_id"],
        degreeLevel: json["degree_level"],
        degreeName: json["degree_name"],
        endYear: json["end_year"],
        id: json["id"],
        maxGrade: json["max_grade"],
        pdfUrl: json["pdf_url"],
        startYear: json["start_year"],
        university: json["university"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_grade": applicantGrade,
        "applicant_id": applicantId,
        "degree_level": degreeLevel,
        "degree_name": degreeName,
        "end_year": endYear,
        "id": id,
        "max_grade": maxGrade,
        "pdf_url": pdfUrl,
        "start_year": startYear,
        "university": university,
    };
}

class Language {
    Language({
         this.applicantId,
         this.id,
         this.language,
         this.level,
    });

    int? applicantId;
    int? id;
    String? language;
    String? level;

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        applicantId: json["applicant_id"],
        id: json["id"],
        language: json["language"],
        level: json["level"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "id": id,
        "language": language,
        "level": level,
    };
}

class Research {
    Research({
         this.applicantId,
         this.description,
         this.id,
         this.organizationName,
         this.position,
         this.superviser,
         this.superviserEmail,
    });

    int? applicantId;
    String? description;
    int? id;
    String? organizationName;
    String? position;
    String? superviser;
    String? superviserEmail;

    factory Research.fromJson(Map<String, dynamic> json) => Research(
        applicantId: json["applicant_id"],
        description: json["description"],
        id: json["id"],
        organizationName: json["organization_name"],
        position: json["position"],
        superviser: json["superviser"],
        superviserEmail: json["superviser_email"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "description": description,
        "id": id,
        "organization_name": organizationName,
        "position": position,
        "superviser": superviser,
        "superviser_email": superviserEmail,
    };
}

class Skill {
    Skill({
         this.applicantId,
         this.id,
         this.skill,
    });

    int? applicantId;
    int? id;
    String? skill;

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        applicantId: json["applicant_id"],
        id: json["id"],
        skill: json["skill"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "id": id,
        "skill": skill,
    };
}

class WorkExperience {
    WorkExperience({
         this.applicantId,
         this.companyName,
         this.companyWebsite,
         this.description,
         this.employmentType,
         this.endMonth,
         this.endYear,
         this.id,
         this.startMonth,
         this.startYear,
         this.workPosition,
    });

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

    factory WorkExperience.fromJson(Map<String, dynamic> json) => WorkExperience(
        applicantId: json["applicant_id"],
        companyName: json["company_name"],
        companyWebsite: json["company_website"],
        description: json["description"],
        employmentType: json["employment_type"],
        endMonth: json["end_month"],
        endYear: json["end_year"],
        id: json["id"],
        startMonth: json["start_month"],
        startYear: json["start_year"],
        workPosition: json["work_position"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "company_name": companyName,
        "company_website": companyWebsite,
        "description": description,
        "employment_type": employmentType,
        "end_month": endMonth,
        "end_year": endYear,
        "id": id,
        "start_month": startMonth,
        "start_year": startYear,
        "work_position": workPosition,
    };
}

class User {
    User({
         this.bio,
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
         this.socialMedias,
    });

    String? bio;
    List<BlockedOrganization>? blockedOrganizations;
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
    List<SocialMedia>? socialMedias;

    factory User.fromJson(Map<String, dynamic> json) => User(
        bio: json["bio"],
        blockedOrganizations: List<BlockedOrganization>.from(json["blocked_organizations"].map((x) => BlockedOrganization.fromJson(x))),
        city: json["city"],
        country: json["country"],
        dateOfBirth: json["date_of_birth"],
        email: json["email"],
        fullName: json["full_name"],
        id: json["id"],
        imageUrl: json["image_url"],
        invisibleAge: json["invisible_age"],
        lang: json["lang"],
        lastStep: json["last_step"],
        phoneNumber: json["phone_number"],
        profession: json["profession"],
        role: json["role"],
        socialMedias: List<SocialMedia>.from(json["social_medias"].map((x) => SocialMedia.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "bio": bio,
        "blocked_organizations": List<dynamic>.from(blockedOrganizations!.map((x) => x.toJson())),
        "city": city,
        "country": country,
        "date_of_birth": dateOfBirth,
        "email": email,
        "full_name": fullName,
        "id": id,
        "image_url": imageUrl,
        "invisible_age": invisibleAge,
        "lang": lang,
        "last_step": lastStep,
        "phone_number": phoneNumber,
        "profession": profession,
        "role": role,
        "social_medias": List<dynamic>.from(socialMedias!.map((x) => x.toJson())),
    };
}

class BlockedOrganization {
    BlockedOrganization({
         this.applicantId,
         this.companyId,
         this.companyInfo,
         this.createdAt,
         this.id,
    });

    int? applicantId;
    int? companyId;
    CompanyInfo? companyInfo;
    String? createdAt;
    int? id;

    factory BlockedOrganization.fromJson(Map<String, dynamic> json) => BlockedOrganization(
        applicantId: json["applicant_id"],
        companyId: json["company_id"],
        companyInfo: CompanyInfo.fromJson(json["company_info"]),
        createdAt: json["created_at"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "company_id": companyId,
        "company_info": companyInfo?.toJson(),
        "created_at": createdAt,
        "id": id,
    };
}

class CompanyInfo {
    CompanyInfo({
         this.city,
         this.companyName,
         this.country,
         this.createdAt,
         this.description,
         this.email,
         this.imageUrl,
         this.phoneNumber,
         this.workersCount,
    });

    String? city;
    String? companyName;
    String? country;
    String? createdAt;
    String? description;
    String? email;
    String? imageUrl;
    String? phoneNumber;
    String? workersCount;

    factory CompanyInfo.fromJson(Map<String, dynamic> json) => CompanyInfo(
        city: json["city"],
        companyName: json["company_name"],
        country: json["country"],
        createdAt: json["created_at"],
        description: json["description"],
        email: json["email"],
        imageUrl: json["image_url"],
        phoneNumber: json["phone_number"],
        workersCount: json["workers_count"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "company_name": companyName,
        "country": country,
        "created_at": createdAt,
        "description": description,
        "email": email,
        "image_url": imageUrl,
        "phone_number": phoneNumber,
        "workers_count": workersCount,
    };
}

class SocialMedia {
    SocialMedia({
         this.applicantId,
         this.id,
         this.name,
         this.url,
    });

    int? applicantId;
    int? id;
    String? name;
    String? url;

    factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
        applicantId: json["applicant_id"],
        id: json["id"],
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "id": id,
        "name": name,
        "url": url,
    };
}
