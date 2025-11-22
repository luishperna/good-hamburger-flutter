class UserModel {
  final String name;

  const UserModel({required this.name});

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
