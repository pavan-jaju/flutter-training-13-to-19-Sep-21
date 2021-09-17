class Category {
  late String id;
  late String name;

  Category({required this.id, required this.name});

  Category.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.name = map["name"];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
