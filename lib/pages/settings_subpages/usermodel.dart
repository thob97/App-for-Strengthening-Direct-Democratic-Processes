class User {
  final int index;
  final String name;
  final String email;
  //final String password;  //comment for http
  final String picture;
  const User(
      {required this.index,
      required this.name,
      required this.email,
    //  required this.password,  //comment for http
      required this.picture
  });
}
