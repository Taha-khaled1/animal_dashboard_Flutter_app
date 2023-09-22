class ServiceOrder {
  bool? success;
  String? message;
  int? code;
  List<Data>? data;

  ServiceOrder({this.success, this.message, this.code, this.data});

  ServiceOrder.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? vendorId;
  int? serviceId;
  int? totalPrice;
  String? date;
  String? time;
  String? createdAt;
  String? updatedAt;
  String? paymentMethod;
  String? paymentStatus;
  User? user;
  Service? service;

  Data(
      {this.id,
      this.userId,
      this.vendorId,
      this.serviceId,
      this.totalPrice,
      this.date,
      this.time,
      this.createdAt,
      this.updatedAt,
      this.paymentMethod,
      this.paymentStatus,
      this.user,
      this.service});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    vendorId = json['vendor_id'];
    serviceId = json['service_id'];
    totalPrice = json['total_price'];
    date = json['date'];
    time = json['time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['vendor_id'] = this.vendorId;
    data['service_id'] = this.serviceId;
    data['total_price'] = this.totalPrice;
    data['date'] = this.date;
    data['time'] = this.time;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['payment_method'] = this.paymentMethod;
    data['payment_status'] = this.paymentStatus;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? number;
  String? phone;
  String? profileImage;

  User(
      {this.id,
      this.name,
      this.email,
      this.number,
      this.phone,
      this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    number = json['Number'];
    phone = json['phone'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['Number'] = this.number;
    data['phone'] = this.phone;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

class Service {
  int? id;
  String? enServiceName;
  String? arServiceName;
  String? startData;
  String? endData;
  String? serviceImage;
  String? enDescription;
  String? arDescription;
  String? createdAt;
  int? vendorId;
  int? price;
  String? imageUrl;

  Service(
      {this.id,
      this.enServiceName,
      this.arServiceName,
      this.startData,
      this.endData,
      this.serviceImage,
      this.enDescription,
      this.arDescription,
      this.createdAt,
      this.vendorId,
      this.price,
      this.imageUrl});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enServiceName = json['en_Service_Name'];
    arServiceName = json['ar_Service_Name'];
    startData = json['start_data'];
    endData = json['end_data'];
    serviceImage = json['Service_image'];
    enDescription = json['en_Description'];
    arDescription = json['ar_Description'];
    createdAt = json['created_at'];
    vendorId = json['vendor_id'];
    price = json['price'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['en_Service_Name'] = this.enServiceName;
    data['ar_Service_Name'] = this.arServiceName;
    data['start_data'] = this.startData;
    data['end_data'] = this.endData;
    data['Service_image'] = this.serviceImage;
    data['en_Description'] = this.enDescription;
    data['ar_Description'] = this.arDescription;
    data['created_at'] = this.createdAt;
    data['vendor_id'] = this.vendorId;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
