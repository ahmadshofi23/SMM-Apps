class LoginModels {
  String? status;
  String? message;
  Data? data;

  LoginModels({this.status, this.message, this.data});

  LoginModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['payload'] != null ? new Data.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['payload'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  int? documentUploadId;
  String? name;
  String? username;
  String? email;
  String? emailVerifiedAt;
  String? address;
  String? phone;
  String? accountType;
  int? createdUser;
  String? createdAt;
  int? editedUser;
  String? editedAt;
  int? deletedUser;
  String? deletedAt;
  String? imageSrc;
  Customer? customer;
  String? picture;

  User(
      {this.id,
      this.documentUploadId,
      this.name,
      this.username,
      this.email,
      this.emailVerifiedAt,
      this.address,
      this.phone,
      this.accountType,
      this.createdUser,
      this.createdAt,
      this.editedUser,
      this.editedAt,
      this.deletedUser,
      this.deletedAt,
      this.imageSrc,
      this.customer,
      this.picture});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentUploadId = json['document_upload_id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    address = json['address'];
    phone = json['phone'];
    accountType = json['account_type'];
    createdUser = json['created_user'];
    createdAt = json['created_at'];
    editedUser = json['edited_user'];
    editedAt = json['edited_at'];
    deletedUser = json['deleted_user'];
    deletedAt = json['deleted_at'];
    imageSrc = json['image_src'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['document_upload_id'] = this.documentUploadId;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['account_type'] = this.accountType;
    data['created_user'] = this.createdUser;
    data['created_at'] = this.createdAt;
    data['edited_user'] = this.editedUser;
    data['edited_at'] = this.editedAt;
    data['deleted_user'] = this.deletedUser;
    data['deleted_at'] = this.deletedAt;
    data['image_src'] = this.imageSrc;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['picture'] = this.picture;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  int? createdUser;
  String? createdAt;
  int? editedUser;
  String? editedAt;
  int? deletedUser;
  String? deletedAt;
  Pivot? pivot;

  Customer(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.phone,
      this.createdUser,
      this.createdAt,
      this.editedUser,
      this.editedAt,
      this.deletedUser,
      this.deletedAt,
      this.pivot});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    createdUser = json['created_user'];
    createdAt = json['created_at'];
    editedUser = json['edited_user'];
    editedAt = json['edited_at'];
    deletedUser = json['deleted_user'];
    deletedAt = json['deleted_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['created_user'] = this.createdUser;
    data['created_at'] = this.createdAt;
    data['edited_user'] = this.editedUser;
    data['edited_at'] = this.editedAt;
    data['deleted_user'] = this.deletedUser;
    data['deleted_at'] = this.deletedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? customerId;
  int? id;

  Pivot({this.userId, this.customerId, this.id});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    customerId = json['customer_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['customer_id'] = this.customerId;
    data['id'] = this.id;
    return data;
  }
}
