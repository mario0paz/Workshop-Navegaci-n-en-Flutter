import 'package:flutter/material.dart';
import 'package:Workshop-Navegaci-n-en-Flutter/screens/view_image.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 33, 166, 243),
            ),
            child: Center(
              child: Text(
                'Anime Workshop Navigations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (ModalRoute.of(context)?.settings.name != '/')
            _buildListTile(
              title: 'Home',
              icon: Icons.home,
              onTap: () => _navigateTo(context, '/'),
            ),
          _buildListTile(
            title: 'Viewer',
            icon: Icons.image,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewImage()),
            ),
          ),
        ],
      ),
    );
  }

  
  ListTile _buildListTile({required String title, required IconData icon, required VoidCallback onTap}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Color.fromARGB(255, 58, 59, 59),
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Icon(icon),
      onTap: onTap,
    );
  }

  
  void _navigateTo(BuildContext context, String route) {
    Navigator.pop(context);
    Navigator.pushNamed(context, route);
  }
}
