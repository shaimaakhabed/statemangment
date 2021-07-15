class ProductModel{
  int id;
  String name;
  num price;
  String imageUrl;
  bool isFavourite;
ProductModel(int id, {
  this.name,
this.price,
this.imageUrl,
this.isFavourite=false,
});

}