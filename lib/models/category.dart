class Category {
  final String image;
  final String name;

  Category({
    required this.image,
    required this.name
});
}

final List<Category> categories  = [
  Category(
    image: "assets/images/monito.jpg",
    name: "Electronics"
  ),
  Category(
    image: "assets/images/lenovo.jpg",
    name: "Electronics"
  ),
  Category(
    image: "assets/images/nike.jpg",
    name: "Shoes"
  ),
  Category(
    image: "assets/images/men.jpg",
    name: "Clothes"
  ),
  Category(
    image: "assets/images/avon.jpg",
    name: "Beauty"
  )
];