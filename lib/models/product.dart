

class Product{
   final String image;
   final String name;
   final double price;
   final double rating;
   final int  reviews;

   Product({
     required this.image,
     required this.name,
     required this.price,
     required this.rating,
     required this.reviews
});
}

final List<Product> products  = [
  Product(
    image: "assets/images/lenovo.jpg",
    name: "Lenovo laptop",
      price: 650000,
    rating: 4.1,
    reviews: 2
  ),
Product(
  image: "assets/images/monito.jpg",
  name: "Acer monito",
  price: 510000,
  rating: 2.6,
  reviews: 4
)
  ,
  Product(
    image: "assets/images/iphone.jpg",
    name: "iphone 12 pro max",
    price: 150000,
    rating: 4.5,
    reviews: 24
  ),
  Product(
      image: "assets/images/samsung.jpg",
      name: "samsung g s26",
      price: 150000,
      rating: 4.5,
      reviews: 24
  ),
  Product(
    image: "assets/images/macbook.jpg",
    name: "macbook v12 pro",
    price: 1150000,
    rating: 4.5,
    reviews: 24
  ),
  Product(
    image: "assets/images/mouse.jpg",
    name: "wireless mouse",
    price: 18000,
    rating: 2.9,
    reviews: 60
  ),
  Product(
    image: "assets/images/flash.jpg",
    name: "flash drive",
    price: 15000,
    rating: 4.5,
    reviews: 24
  ),
  Product(
    image: "assets/images/nike.jpg",
    name: "nike shoes",
    price: 15000,
    rating: 4.5,
    reviews: 24
  ),
  Product(
    image: "assets/images/beats.jpg",
    name: "beats headphones",
    price: 15000,
    rating: 4.5,
    reviews: 24
  ),
  Product(
    image: "assets/images/groceries1.jpg",
    name: "groceries",
    price: 15000,
    rating: 4.5,
    reviews: 24
  ),

];