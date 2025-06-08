import 'package:atm_provider/atm_with_provider/atm_with_provider/model/user_model.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  List<User> users = [];
  User? _currentUser;
  User? get currentUser => _currentUser;

  void addUser(User user) {
    final userList = users.where((e) => e.username == user.username).toList();
    if (userList.isEmpty) {
      users.add(user);
      notifyListeners();
    } else {
      throw Exception('this user already taken');
    }
  }

  void userLogin(String username, String password) {
    final userList = users.where((e) => e.username == username).toList();
    if (userList.isNotEmpty) {
      if (username == userList[0].username &&
          password == userList[0].password) {
        _currentUser = userList[0];
        notifyListeners();
      } else {
        throw Exception('inavalid user or password');
      }
    }
  }

  void logOut() {
    if (_currentUser != null) {
      _currentUser == null;
      notifyListeners();
    }
  }

  void deposit(double amount) {
    if (_currentUser != null) {
      final currentBalance = _currentUser!.balance;
      _currentUser = _currentUser!.copyWith(balance: currentBalance + amount);
      notifyListeners();
    }
  }

  void withdraw(double amount) {
    if (_currentUser != null) {
      final currentBalance = _currentUser!.balance;
      if (currentBalance >= amount) {
        _currentUser = _currentUser!.copyWith(balance: currentBalance - amount);
        notifyListeners();
      } else {
        throw Exception('envalied value');
      }
    }
  }
}
