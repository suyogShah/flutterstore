class Category {
  String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
    );
  }
  List<Category> categories = [
  Category(name: "electronics"),
  Category(name: "jewelery"),
  Category(name: "men's clothing"),
  Category(name: "women's clothing"),
];
}