import 'package:flutter/material.dart';
// import 'package:flutter_application_2/screen/profile.dart';
import 'package:flutter_application_2/screen/about.dart';
import 'package:flutter_application_2/screen/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedindex = 0;
  
  List<Widget> get _pages => [
     const Center(child: Text('Selamat Datang Ozan')),
     const Center(child: Text('Halaman Bookmark')),
     const Center(child: Text('Halaman Cart')),
     Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  'Ozan',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {},
                      heroTag: 'Follow',
                      elevation: 0,
                      label: const Text('Follow'),
                      icon: const Icon(Icons.person_add_alt_1),
                    ),
                    const SizedBox(width: 16),
                    FloatingActionButton.extended(
                      onPressed: () {},
                      heroTag: 'Message',
                      elevation: 0,
                      label: const Text('Message'),
                      icon: const Icon(Icons.message_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const _ProfileInfoRow(),
              ],
            ),
          ),
        ],
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      title: const Text(
        'Iuran Warga',
        style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        ),
      ),
      ),
      drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
        const DrawerHeader(
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 71, 71, 71),
          ),
          child: Text(
          'Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
          setState(() {
            _selectedindex = 0;
          });
          Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('Tentang Aplikasi'),
          onTap: () {
          showAboutDialog(
            context: context,
            applicationName: 'Iuran Warga',
            applicationVersion: '1.0.0',
            applicationIcon: const Icon(Icons.info),
            children: [
            const Text('Aplikasi untuk mengelola iuran warga.'),
            ],
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AboutPage(),));
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
          },
        ),
        ],
      ),
      ),
      body: _pages[_selectedindex],
      bottomNavigationBar: NavigationBar(
      animationDuration: const Duration(
        milliseconds: 300,
      ),
      selectedIndex: _selectedindex,
      onDestinationSelected: (index) {
        setState(() {
        _selectedindex = index;
        });
      },
      destinations: const [
        NavigationDestination(
        icon: Icon(Icons.home),
        label: 'Beranda',
        ),
        NavigationDestination(
        icon: Icon(Icons.bookmark),
        label: 'Bookmark',
        ),
        NavigationDestination(
        icon: Icon(Icons.shopping_cart),
        label: 'Cart',
        ),
        NavigationDestination(
        icon: Icon(Icons.person),
        label: 'Profile',
        ),
      ],
      ),
    );
  }
}
class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({super.key});

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem(title: 'Posts', value: 100),
    ProfileInfoItem(title: 'Followers', value: 200),
    ProfileInfoItem(title: 'Following', value: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
        .map((item) => Expanded(
          child: Row(
            children: [
              if (_items.indexOf(item) != 0) const VerticalDivider(),
              Expanded(child: _singleItem(context, item))
            ],
          ),
        ))
        .toList(),
      ),
    );
  }
}

Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
  mainAxisAlignment: MainAxisAlignment.center,
 children: [
  Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Text(
      item.value.toString(),
      style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  ),
       Text(item.title, style: Theme.of(context).textTheme.bodySmall),
 ],
);
class ProfileInfoItem {
  final String title;
  final int value;

  const ProfileInfoItem({required this.title, required this.value});
}
class _TopPortion extends StatelessWidget {
  const _TopPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff0043ba), Color(0xff006df1)],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        Align(alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 150,
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwallpapercat.com%2Fmagic-kaito-wallpapers&psig=AOvVaw0WqB15lKJ_BMy4uUmPIJ5N&ust=1755073929192000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKCsnIPuhI8DFQAAAAAdAAAAABAE',
                    ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 0, 255, 106),
                    ),
                  ),
                ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}