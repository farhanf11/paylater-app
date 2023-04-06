class UserProfileBrowse {
  String userId;
  int age;
  String name;
  String email;
  String imageUrl;

  UserProfileBrowse(
      this.userId,
      this.age,
      this.name,
      this.email,
      this.imageUrl,
      );

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'userId': userId,
    'age': age,
    'name': name,
    'email': email,
    'imageUrl' : imageUrl,
  };
}
