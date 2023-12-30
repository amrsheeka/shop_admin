class ProductModel{
  late String id;
  late String name;
  late String description;
  late String details;
  late String type;
  late double price;
  late double oldPrice;
  late double rate = 0;
  late int numberOfRatings=0;
  List<dynamic>images=[];
  ProductModel.fromJson({required json}){
    id=json['id'];
    name=json['name'];
    description=json['description'];
    details=json['details'];
    type=json['type'];
    price=double.parse(json['price']);
    oldPrice=double.parse(json['oldPrice']);
    rate=double.parse(json['rate']??'0');
    numberOfRatings=int.parse(json['numberOfRatings']??'0');
    images=json['images'];
  }
  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'details': details,
      'type': type,
      'price': price.toString(),
      'oldPrice': oldPrice.toString(),
      'rate': rate.toString(),
      'numberOfRatings': numberOfRatings.toString(),
      'images': images
    };
  }
}