class DepartmentalExecutives {
  String image;
  String name;
  String positionEnforced;
  String id;

  DepartmentalExecutives.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    name = data['name'];
    positionEnforced = data['position_enforced'];
    id = data['id'];
  }
}