import 'package:first_app/scoped-models/user.dart';
import 'package:scoped_model/scoped_model.dart';

import './products.dart';
import './user.dart';
import './user_products.dart';

class MainModel extends Model
    with ConnectedProductsModel, ProductsModel, UserModel {}
