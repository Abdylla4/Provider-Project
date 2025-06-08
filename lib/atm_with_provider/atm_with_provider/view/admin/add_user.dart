import 'package:atm_provider/atm_with_provider/atm_with_provider/model/user_model.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view/admin/user_list.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/providers/auth_provider.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/widgets/custom_button.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserList(),
                ),
              );
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTexField(
                  controller: usernameController,
                  hintText: 'username',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'bos goyma';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTexField(
                    controller: passwordController, hintText: 'password'),
                const SizedBox(
                  height: 10,
                ),
                AppTexField(
                    controller: balanceController, hintText: 'Balance'),
                Consumer<AuthProvider>(builder: (context, authProvider, state) {
                  return CustomButton(
                    color: Colors.orange,
                    title: 'Save',
                    onPressed: () {
                      try {
                        if (formKey.currentState!.validate()) {
                          authProvider.addUser(User(
                              username: usernameController.text,
                              password: passwordController.text,
                              balance:
                                  double.tryParse(balanceController.text) ??
                                      0));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('add succes'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          clearTextFild();
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearTextFild() {
    usernameController.clear();
    passwordController.clear();
    balanceController.clear();
  }
}
