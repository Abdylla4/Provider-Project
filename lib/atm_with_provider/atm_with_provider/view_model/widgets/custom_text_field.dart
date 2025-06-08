// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTexField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  final ValidatorFunction? validator;
  AppTexField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:
          InputDecoration(border: const OutlineInputBorder(), hintText: hintText),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Can not be Empty';
            }
            return null;
          },
    );
  }
}

typedef ValidatorFunction = String? Function(String?)?;
