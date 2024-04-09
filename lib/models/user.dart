class UserName {
  int? id;
  String? firstName;
  String? lastName;
  String? imgUrl;

  UserName({
    this.id,
    this.firstName,
    this.lastName,
    this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "imgUrl": imgUrl,
    };
  }

  UserName.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    imgUrl = map['imgUrl'];
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
