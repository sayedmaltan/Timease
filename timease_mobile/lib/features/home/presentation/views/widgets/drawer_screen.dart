import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/core/utils/function/logout.dart';
import '../../../../../core/utils/asstes.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String userName = CashHelper.getData('name') ?? 'Guest User';
    final String userEmail = CashHelper.getData('email') ?? 'guest@example.com';

    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                userName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                userEmail,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              currentAccountPicture: Image.asset(
                AssetsImages.timeaseLogo,
                width: 120,
                height: 120,
                alignment: AlignmentDirectional.center,
                fit: BoxFit.cover,
              ),
              currentAccountPictureSize: Size(130, 50),
              decoration: BoxDecoration(
                color: Colors.black38,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            // Emphasize logout
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              logout(context: context);
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
