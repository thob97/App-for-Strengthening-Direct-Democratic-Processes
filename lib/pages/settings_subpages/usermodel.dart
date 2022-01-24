class User {
  const User({
    required this.index,
    required this.name,
    required this.email,
    //  required this.password,  //comment for http
    required this.imagePath,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      index: int.parse(json['id'].toString()),
      name: json['name'].toString(),
      email: json['email'].toString(),
      imagePath:
          'https://banner2.cleanpng.com/20180516/zq/kisspng-computer-icons-google-account-icon-design-login-5afc02dab4a218.0950785215264652427399.jpg',
    );
  }
  final int index;
  final String name;
  final String email;
  final String imagePath;
}
//final String password;  //comment for http
//  required this.password,  //comment for http
