import 'package:atm_provider/atm_with_provider/atm_with_provider/view/user_dashboard/addMoney.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view/user_dashboard/seeBalance.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view/user_dashboard/withdraw.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/providers/auth_provider.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/widgets/atmButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Atm extends StatelessWidget {
  const Atm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atm'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              Atmbutton(
                title: 'Show balance',
                icon: Icons.balance,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Seebalance(),
                    ),
                  );
                },
              ),
              Atmbutton(
                title: 'Show balance',
                icon: Icons.add,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Addmoney(),
                    ),
                  );
                },
              ),
              Atmbutton(
                title: 'Show balance',
                icon: Icons.remove,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Withdraw(),
                    ),
                  );
                },
              ),
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  if (authProvider.currentUser == null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pop(context);
                    });
                  }
                  return Atmbutton(
                    title: 'Log Out',
                    icon: Icons.logout,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog.adaptive(
                          title: const Text('Cykmak isleyanmi'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.read<AuthProvider>().logOut();
                                Navigator.pop(context);
                              },
                              child: const Text('howa'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Yok'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
