class Cow {
  String name;
  String idCollar;
  String weight;
  String breed;
  String lat = "";
  String lon = "";

  Cow({this.name, this.idCollar, this.weight, this.breed});

  Cow.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    idCollar = json['id_collar'];
    weight = json['weight'];
    breed = json['breed'];
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id_collar'] = this.idCollar;
    data['weight'] = this.weight;
    data['breed'] = this.breed;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
