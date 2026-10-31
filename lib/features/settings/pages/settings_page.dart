import 'package:flutter/material.dart';

class SettingsPage
    extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text('Settings'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),

          const ListTile(
            leading:
            Icon(Icons.store),
            title: Text(
              'Business Profile',
            ),
            subtitle: Text(
              'Fruzo n Tech Mango Business',
            ),
          ),

          const Divider(),

          const ListTile(
            leading:
            Icon(Icons.person),
            title: Text('Owner'),
            subtitle:
            Text('Anik Hossain'),
          ),

          const Divider(),

          SwitchListTile(
            value: true,
            onChanged: (value) {},
            title: const Text(
              'Notifications',
            ),
          ),

          const Divider(),

          ListTile(
            leading:
            const Icon(Icons.save),
            title: const Text(
              'Backup Data',
            ),
            onTap: () {},
          ),

          const Divider(),

          ListTile(
            leading:
            const Icon(Icons.info),
            title:
            const Text('About'),
            subtitle: const Text(
              'Version 1.0.0',
            ),
            onTap: () {},
          ),

          const Divider(),

          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text(
              'Logout',
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}