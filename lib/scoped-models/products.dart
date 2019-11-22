import '../models/product.dart';
import './user_products.dart';

class ProductsModel extends ConnectedProductsModel {
  bool _showFavorites = false;

  int get selectedProductIndex {
    return selectedProdIndex;
  }

  List<Product> get allProducts {
    return List.from(products);
  }

  List<Product> get displayProducts {
    if (_showFavorites) {
      return products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(products);
  }

  Product get selectedProduct {
    if (selectedProdIndex == null) {
      return null;
    }
    return products[selectedProdIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void updateProduct(Product product) {
    products[selectedProdIndex] = Product(
      title: product.title,
      description: product.description,
      image: product.image,
      price: product.price,
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId,
      isFavorite: selectedProduct.isFavorite,
    );
    selectedProdIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    products.removeAt(selectedProdIndex);
    selectedProdIndex = null;
    notifyListeners();
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = products[selectedProdIndex].isFavorite;

    products[selectedProdIndex] = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      image: selectedProduct.image,
      price: selectedProduct.price,
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId,
      isFavorite: !isCurrentlyFavorite,
    );
    selectedProdIndex = null;
    notifyListeners();
  }

  void selectProduct(int index) {
    selectedProdIndex = index;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}
