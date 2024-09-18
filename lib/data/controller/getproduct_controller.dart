import 'package:dslsale/data/repository/getproduct_repo.dart';
import 'package:flutter/material.dart';

class GetProductController extends ChangeNotifier {
  bool _isloading = true;
  bool get isloading => _isloading;

  List<dynamic> _product = [];
  List<dynamic> get product => _product;

  final getproductRepo = GetproDuctRepo();

  Future<void> getallproduct() async {
    _isloading = true;
    notifyListeners();
    try {
      final result = await getproductRepo.getAllproduct();
      if (result!.isNotEmpty) {
        _product = result;
        _isloading = false;
        notifyListeners();
      }
    } catch (e) {
      _isloading=false;
      notifyListeners();
      rethrow;
    }
  }
}
