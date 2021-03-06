class PostListingData {
  int id;
  String name;
  String message;
  String designation;
  String employerName;

  PostListingData(
    this.id,
    this.name,
    this.message,
    this.designation,
    this.employerName,
  );

  toMap() {
    return {
      "id": id.toString(),
      "name": name,
      "message": message,
      "designation": designation,
      "employer_name": employerName,
    };
  }

  static PostListingData objectFromMap(Map<String, dynamic> map) {
    return PostListingData(
      map['id'],
      map['name'],
      map['message'],
      map['designation'],
      map['employer_name'],
    );
  }

  static List<PostListingData> fromMapList(List<dynamic> list) {
    List<PostListingData> _list = [];
    for (Map<String, dynamic> map in list) {
      _list.add(objectFromMap(map));
    }
    return _list;
  }
}
