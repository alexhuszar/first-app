import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../models/user.dart';

class ConnectedProductsModel extends Model {
  List<Product> _products = [];
  User _authenticatedUser;
  int _selectedProdIndex;

  void addProduct(Product product) {
    _products.add(Product(
      title: product.title,
      description: product.description,
      image: product.image,
      price: product.price,
      userEmail: _authenticatedUser.email,
      userId: _authenticatedUser.id,
    ));
    notifyListeners();
  }
}

class ProductsModel extends ConnectedProductsModel {
  bool _showFavorites = false;

  int get selectedProductIndex {
    return _selectedProdIndex;
  }

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  Product get selectedProduct {
    if (_selectedProdIndex == null) {
      return null;
    }
    return _products[_selectedProdIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void updateProduct(Product product) {
    _products[_selectedProdIndex] = Product(
      title: product.title,
      description: product.description,
      image: product.image,
      price: product.price,
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId,
      isFavorite: selectedProduct.isFavorite,
    );
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(_selectedProdIndex);
    notifyListeners();
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = _products[_selectedProdIndex].isFavorite;

    _products[_selectedProdIndex] = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      image: selectedProduct.image,
      price: selectedProduct.price,
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId,
      isFavorite: !isCurrentlyFavorite,
    );
    notifyListeners();
  }

  void selectProduct(int index) {
    _selectedProdIndex = index;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

class UserModel extends ConnectedProductsModel {
  void login(String email, String password) {
    _authenticatedUser = User(id: 'xx', email: email, password: password);
  }
}
