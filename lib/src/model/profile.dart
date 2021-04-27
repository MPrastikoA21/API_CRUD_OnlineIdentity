import 'dart:convert';

class Profile {
  int id;
  String name;
  String NIM;
  String Kelas;
  String Instansi;
  int Tgl;
  String email;
  int age;

  Profile({this.id = 0, this.name,this.NIM,this.Kelas, this.Instansi,this.Tgl, this.email, this.age});

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map["id"], name: map["name"], NIM: map["NIM"],Kelas: map["Kelas"], Instansi: map["Instansi"],Tgl: map["Tgl"], email: map["email"], age: map["age"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "NIM": NIM, "Kelas": Kelas, "Instansi": Instansi, "Tgl": Tgl, "email": email, "age": age};
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name,NIM: $NIM,Kelas: $Kelas, Instansi: $Instansi,Tgl: $Tgl, email: $email, age: $age}';
  }

}

List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}

String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
