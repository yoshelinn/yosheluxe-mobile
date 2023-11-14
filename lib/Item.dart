class Item {
  String name;
  int amount;
  String description;

  static List<Item> items = [];

  Item(this.name, this.amount, this.description) {
    items.add(this);
  }
}