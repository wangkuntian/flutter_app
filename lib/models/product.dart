class Product {
  Product(
      {this.name,
      this.price,
      this.sales,
      this.tags,
      this.shop,
      this.location,
      this.image});

  String name;
  double price;
  double sales;
  List<String> tags = [];
  String shop;
  String location;
  String image;
}
