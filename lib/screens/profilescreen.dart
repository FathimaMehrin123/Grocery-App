import 'package:flutter/material.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('Profile'),
              CircleAvatar(backgroundColor: Colors.grey),
              Text('Lorum Ipsum'),
              SizedBox(height: 30),

              Expanded(
                child: ListView(
                  children: [
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: 'Account information',
                      onTap: (){}
                      ),
                    _buildMenuItem(
                      icon: Icons.language,
                      title: 'Language',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.shopping_bag_outlined,
                      title: 'My order',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.location_on_outlined,
                      title: 'Delivery address',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.notifications_outlined,
                      title: 'Notification',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.logout,
                      title: 'Logo out',
                      onTap: () {},
                      
                    ),
                       ])),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap ),
    );
  }
}
