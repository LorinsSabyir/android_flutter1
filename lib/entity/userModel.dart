class User {
  final String id;
  String? firstName;
  String? lastName;
  String? userName;
  String? passWord;

  User({
    required this.id,
    this.firstName,
    this.lastName,
    this.userName, 
    this.passWord,
  });

  // Convert a User instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstName,
      'lastname': lastName,
      'username': userName,
      'password': passWord,
    };
  }

  // Create a User instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstname'],
      lastName: json['lastname'],
      userName: json['username'],
      passWord: json['password'],
    );
  }
}