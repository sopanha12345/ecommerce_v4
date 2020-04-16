
class Spacecraft{
  final String id;
  final String name;
  final String image;
  final String price;
  final String old_price;
  final String brand;
  final String condition;
  final String description;


  Spacecraft({this.id, this.name, this.image, this.price, this.old_price, this.brand, this.condition, this.description});//normal constructor

  factory Spacecraft.fromJson(Map<String, dynamic> data){
    return Spacecraft(
        id: data['id'],
        name: data['name'],
        image: data['image'],
        price: data['price'],
        old_price: data['brand'],
        condition: data['condition'],
        description: data['description']
    );
  }
}