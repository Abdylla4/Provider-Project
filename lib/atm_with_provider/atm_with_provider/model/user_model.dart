// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String password;
  final double balance;
  User({
    required this.username,
    required this.password,
    required this.balance,
  });
  User copyWith({
    String? username,
    String? password,
    double? balance,
  }){
    return User(username: username ?? this.username, password: password ?? this.password, balance: balance ?? this.balance);
  }



  @override
String toString ()=>'User (username : $username , password: $password , balance : $balance)';

  @override

  List<Object?> get props => throw UnimplementedError();}
