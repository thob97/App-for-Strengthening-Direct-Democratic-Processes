class User {
  final int index;
  final String name, email, picture;
  const User(
      {required this.index,
        required this.name,
        required this.email,
        //  required this.password,  //comment for http
        required this.picture
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      index: json['id'],
      name: json['name'],
      email: json['email'], picture: 'https://banner2.cleanpng.com/20180516/zq/kisspng-computer-icons-google-account-icon-design-login-5afc02dab4a218.0950785215264652427399.jpg',
    );
  }
}
//final String password;  //comment for http
//  required this.password,  //comment for http