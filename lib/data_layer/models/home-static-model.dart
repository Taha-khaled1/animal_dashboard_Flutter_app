class HomeStaticModel {
  bool? success;
  String? message;
  int? code;
  Null? direct;
  Data? data;

  HomeStaticModel(
      {this.success, this.message, this.code, this.direct, this.data});

  HomeStaticModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    direct = json['direct'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    data['direct'] = this.direct;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? waitingList;
  int? services;
  int? closed;
  int? totalSales;
  List<Chart>? chart;

  Data(
      {this.waitingList,
      this.services,
      this.closed,
      this.totalSales,
      this.chart});

  Data.fromJson(Map<String, dynamic> json) {
    waitingList = json['waiting_list'];
    services = json['services'];
    closed = json['closed'];
    totalSales = json['total_sales'];
    if (json['chart'] != null) {
      chart = <Chart>[];
      json['chart'].forEach((v) {
        chart!.add(new Chart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['waiting_list'] = this.waitingList;
    data['services'] = this.services;
    data['closed'] = this.closed;
    data['total_sales'] = this.totalSales;
    if (this.chart != null) {
      data['chart'] = this.chart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chart {
  String? date;
  int? totalPrice;

  Chart({this.date, this.totalPrice});

  Chart.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
