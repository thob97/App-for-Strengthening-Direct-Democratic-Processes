import 'package:swp_direktdem_verf_app/service/model/user.dart';

class UserPreferences {
  User myUser = User(
    id: 1,
    first_name: 'Erika',
    last_name: 'Mustermann',
    email: 'name@domain.com',
    password: '********',
    last_login: null,
    date_joined: DateTime.now(),
    is_active: true,
    is_superuser: true,
    is_staff: true,
    //comment for http
    //imagePath:
    //  'https://banner2.cleanpng.com/20180516/zq/kisspng-computer-icons-google-account-icon-design-login-5afc02dab4a218.0950785215264652427399.jpg',
  );
}
