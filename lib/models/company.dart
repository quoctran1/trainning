class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Company? company;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    // var companyFromJson = json['company'];
    // Company companyArray = Company.fromJson(companyFromJson);

    return User(
      id: json['id']??0,
      name: json['name']??"",
      username: json['username']??"",
      email: json['email']??"",
      company: json['company'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'company': company?.toJson(),
    };
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        name: json['name'], catchPhrase: json['catchPhrase'], bs: json['bs']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
  }
}