import 'package:startup_try_2/models/Product.dart';

bool shoporproduct(var name) {
  Dataproduct();
  Datashop();
  var search_product, product = null, search_shop, shop = null;
  for (search_product in products_list) {
    if (name == search_product["p_name"]) {
      product = search_product;
      return false;
      break;
    }
  }
  for (search_shop in shops) {
    if (name == search_shop["s_name"]) {
      shop = search_shop;
      return true;
      break;
    }
  }
}
