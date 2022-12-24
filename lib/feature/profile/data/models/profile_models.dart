class ProfileModels {
  int? id;
  String? name;
  String? username;
  String? email;
  String? address;
  String? phone;
  String? imageSrc;

  ProfileModels(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.imageSrc});

  ProfileModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    imageSrc = json['image_src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['image_src'] = this.imageSrc;
    return data;
  }
}
