class User {
  String? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? passWord;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.passWord,
  });

  // Convert a User instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'passWord': passWord,
    };
  }

  // Create a User instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      passWord: json['passWord'],
    );
  }
}
