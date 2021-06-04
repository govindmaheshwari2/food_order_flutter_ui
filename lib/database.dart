class Category {
  final String name;
  final String image;
  final List<Item> items;
  Category({required this.name, required this.image, required this.items});
}

List<Category> categoryList = [
  Category(
      name: "Burger", image: "assets/categoryItem/burger.svg", items: burger),
  Category(name: "Drink", image: "assets/categoryItem/drink.svg", items: drink),
  Category(
      name: "Icecream",
      image: "assets/categoryItem/icecream.svg",
      items: burger),
  Category(
      name: "Pizza", image: "assets/categoryItem/pizza.svg", items: burger),
  Category(name: "Sweet", image: "assets/categoryItem/sweet.svg", items: burger)
];

class Item {
  final String name;
  final String price;
  final String image;
  final String detail;
  final String rating;
  final String cal;
  final String time;

  Item(
      {required this.rating,
      required this.cal,
      required this.time,
      required this.name,
      required this.price,
      required this.image,
      required this.detail});
}

List<Item> burger = [
  Item(
      name: "Double Cheeze",
      price: "100",
      image: "assets/burger/burger.png",
      detail:
          "This cheeze burger use 100% best quality cheeze with sliced tomatoes, cucumbers, vegetables and onions. Ketchups like tomatoes, peri peri, mayo and green chille is used. Customization option is also available.",
      rating: "4.9",
      cal: "250 kcal",
      time: "30 min"),
  Item(
      name: "Floating Burger",
      price: "130",
      image: "assets/burger/burger2.png",
      rating: "4.9",
      cal: "250 kcal",
      time: "30 min",
      detail:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. "),
  Item(
      name: "Delicious Round",
      price: "80",
      image: "assets/burger/burger3.png",
      rating: "4.9",
      cal: "250 kcal",
      time: "30 min",
      detail:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. "),
];

List<Item> drink = [
  Item(
      name: "Mojito",
      price: "100",
      image: "assets/drink/mojito.png",
      rating: "4.9",
      cal: "250 kcal",
      time: "30 min",
      detail:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. "),
  Item(
      name: "Cold Coffee",
      price: "130",
      image: "assets/drink/coffee.png",
      rating: "4.9",
      cal: "250 kcal",
      time: "30 min",
      detail:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. "),
  Item(
      name: "Cold Tea",
      price: "80",
      image: "assets/drink/tea.png",
      rating: "4.9",
      cal: "250 kcal",
      time: "30 min",
      detail:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. "),
];
