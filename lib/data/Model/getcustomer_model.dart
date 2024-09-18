import 'dart:convert';

List<Customer> customerFromJson(String str) =>
    List<Customer>.from(
        json.decode(str).map((x) => Customer.fromJson(x)));
class Customer {
  final int customerId;
  final String shopName;
  final String customerFullName;
  final String? customerNickName;
  final String customerPhone;
  final int province;
  final int district;
  final String village;
  final String? villageUnit;
  final String? road;
  final String? customerStatus;
  final String dayVisit;
  final String? addBy;
  final String? dateAdd;
  final int provinceId;
  final String provinceName;
  final int districtsId;
  final String districtsName;

  Customer({
    required this.customerId,
    required this.shopName,
    required this.customerFullName,
    this.customerNickName,
    required this.customerPhone,
    required this.province,
    required this.district,
    required this.village,
    this.villageUnit,
    this.road,
    this.customerStatus,
    required this.dayVisit,
    this.addBy,
    this.dateAdd,
    required this.provinceId,
    required this.provinceName,
    required this.districtsId,
    required this.districtsName,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json['customer_id'],
      shopName: json['shop_name'],
      customerFullName: json['customer_full_name'],
      customerNickName: json['customer_nick_name'],
      customerPhone: json['customer_phone'],
      province: json['province'],
      district: json['district'],
      village: json['village'],
      villageUnit: json['village_unit'],
      road: json['road'],
      customerStatus: json['customer_status'],
      dayVisit: json['day_visit'],
      addBy: json['add_by'],
      dateAdd: json['date_add'],
      provinceId: json['province_id'],
      provinceName: json['province_name'],
      districtsId: json['districts_id'],
      districtsName: json['districts_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'shop_name': shopName,
      'customer_full_name': customerFullName,
      'customer_nick_name': customerNickName,
      'customer_phone': customerPhone,
      'province': province,
      'district': district,
      'village': village,
      'village_unit': villageUnit,
      'road': road,
      'customer_status': customerStatus,
      'day_visit': dayVisit,
      'add_by': addBy,
      'date_add': dateAdd,
      'province_id': provinceId,
      'province_name': provinceName,
      'districts_id': districtsId,
      'districts_name': districtsName,
    };
  }
}
