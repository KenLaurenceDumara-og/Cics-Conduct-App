class User {
  final String name;
  final int age;
  final String bio;
  final List<Education> education;
  final List<String> skills;
  final List<String> interests;
  final List<Contact> contactDetails;

  User({
    required this.name,
    required this.age,
    required this.bio,
    required this.education,
    required this.skills,
    required this.interests,
    required this.contactDetails,
  });
}

class Education {
  final String institution;
  final String degree;
  final String year;

  Education({
    required this.institution,
    required this.degree,
    required this.year,
  });
}

class Contact {
  final String type;
  final String value;

  Contact({
    required this.type,
    required this.value,
  });
}
