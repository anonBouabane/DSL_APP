import 'package:dslsale/data/repository/customer_repo.dart';
import 'package:flutter/material.dart';

class GetCustomerController extends ChangeNotifier {
  List<dynamic> _customer = [];
  List<dynamic> get customer => _customer;

  bool _isloading = true;
  bool get isloading => _isloading;

  final getAllCustoRepo = GetCustomerRepo();

  Future<void> fetchcustomer() async {
    _isloading = true;
    notifyListeners();

    try {
      final result = await getAllCustoRepo.fetchcustomer();

      if (result != null && result.isNotEmpty) {
        _customer = result;
        _isloading = false;
        notifyListeners();
      } else {
        _customer = []; // Handle case where result is empty
        _isloading = false;
        notifyListeners();
      }
    } catch (e) {
      _isloading = false;
      notifyListeners();
      throw e.toString();
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
}
