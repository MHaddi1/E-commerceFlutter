class shopy {
  String? name = "Product1";
  int? price = 100;
  String? description  = "This is descriptoin";
  String? imageUrl;

  shopy({this.name, this.price, this.description, this.imageUrl});

  shopy.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['Description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['Description'] = this.description;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
