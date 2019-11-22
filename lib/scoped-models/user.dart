import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';
import './user_products.dart';

class UserModel extends ConnectedProductsModel {
  void login(String email, String password) {
    authenticatedUser = User(id: 'xx', email: email, password: password);
  }
}
