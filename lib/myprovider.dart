import 'package:flutter/material.dart';
import 'package:statemangment/product_model.dart';

class MyProvider extends ChangeNotifier {
  List<ProductModel>favouriteProducts=[];

  // TabController tabController;
  List<ProductModel> products=[
    ProductModel(1,
      imageUrl: 'https://cdn.pixabay.com/photo/2020/05/26/09/32/product-5222398_960_720.jpg',
    name: 'Eyeglasses',price: 150),
    ProductModel(2,imageUrl: 'https://cdn.pixabay.com/photo/2014/05/02/21/47/laptop-336369_960_720.jpg',
    name: 'laptop',price: 10100),
    ProductModel(3,imageUrl: 'https://media.istockphoto.com/vectors/old-wooden-chair-isolated-on-white-backgroundfurniture-for-dining-vector-id1159568874',
    name: 'Chair',price: 1000),
    ProductModel(4,imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/61lnzTv2a0L._AC_SL1000_.jpg',
    name: 'Headsets',price: 100),
    ProductModel(5,imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
    name: 'Phone',price: 10000),
  ];

   setFavouriteProducts(){
    this.favouriteProducts=products.where((element) => element.isFavourite).toList();
    notifyListeners();
  }

  addToFavourite(ProductModel productModel){
    int index=products.indexOf(productModel);
    products[index].isFavourite=!products[index].isFavourite;
    notifyListeners();
  }
  String text = 'initial value';
  changeTextValue(String value) {
    this.text = value;
    notifyListeners();
  }
}