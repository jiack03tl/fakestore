class Authors {
  int? id;
  String? name;
  String? author;
  String? date;

  Authors({this.id, this.name, this.author, this.date});

  Authors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    author = json['author'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['author'] = this.author;
    data['date'] = this.date;
    return data;
  }
}
