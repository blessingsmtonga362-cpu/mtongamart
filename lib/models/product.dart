

class product{
   final String image;
   final String name;
   final double price;
   final double rating;
   final int  reviews;

   product({
     required this.image,
     required this.name,
     required this.price,
     required this.rating,
     required this.reviews
});
}

final List<product> products  = [
  product(
    image: "assets/images/iphone.jpg",
    name: "iphone 12 pro max",
    price: 150000,
    rating: 4.5,
    reviews: 24
  ),
  product(
      image: "assets/images/samsung.jpg",
      name: "samsung g s26",
      price: 150000,
      rating: 4.5,
      reviews: 24
  ),
  product(
    image: "assets/images/macbook.jpg",
    name: "macbook v12 pro",
    price: 1150000,
    rating: 4.5,
    reviews: 24
  ),
  product(
    image: "assets/images/mouse.jpg",
    name: "wireless mouse",
    price: 18000,
    rating: 2.9,
    reviews: 60
  ),
  product(
    image: "assets/images/flash.jpg",
    name: "flash drive",
    price: 15000,
    rating: 4.5,
    reviews: 24
  ),
  product(
    image: "assets/images/nike.jpg",
    name: "nike shoes",
    price: 15000,
    rating: 4.5,
    reviews: 24
  ),
  product(
    image: "assets/images/beats.jpg",
    name: "beats headphones",
    price: 15000,
    rating: 4.5,
    reviews: 24
  ),
  product(
    image: "assets/images/groceries1.jpg",
    name: "groceries",
    price: 15000,
    rating: 4.5,
    reviews: 24
  ),

];