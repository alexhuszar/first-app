import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../models/user.dart';

class ConnectedProductsModel extends Model {
  List<Product> products = [];
  User authenticatedUser;
  int selectedProdIndex;

  void addProduct(Product product) {
    products.add(Product(
      title: product.title,
      description: product.description,
      image: product.image,
      price: product.price,
      userEmail: authenticatedUser.email,
      userId: authenticatedUser.id,
    ));
    selectedProdIndex = null;
    notifyListeners();
  }
}
