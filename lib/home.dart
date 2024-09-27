import 'package:flutter/material.dart';
import 'menu.dart';
import 'cart.dart';
import 'account.dart';

class HomeScreen extends StatefulWidget {
  final Function(ThemeMode) onThemeChange;

  const HomeScreen({Key? key, required this.onThemeChange}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  final List<Widget> _screens = const [
    HomeScreenContent(),
    MenuScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DIVINE BLISS',
          style: TextStyle(
            fontSize: 28,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(onThemeChange: widget.onThemeChange),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.white12,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}


class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Stack(
            children: [
              Image.asset(
                'assets/pic3.jpg',
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
              Positioned(
                left: 20,
                right: 20,
                top: 100,
                child: Center(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "WHAT HEAVENLY TASTE DO YOU SEEK?",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),


          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Choices',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                buildFoodCard('assets/pic1.jpg', 'Eve\'s Apple Pie'),
                buildFoodCard('assets/pic2.jpg', 'Cloudy Mojito'),
                buildFoodCard('assets/pic4.jpg', 'Paradise Pasta'),
                buildFoodCard('assets/pic5.jpg', 'Coffee Essentials'),
              ],
            ),
          ),
        ],
      ),
    );
  }


  static Widget buildFoodCard(String imagePath, String title) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  final Function(ThemeMode) onThemeChange;

  const SettingsScreen({Key? key, required this.onThemeChange}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isDarkMode = Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 28,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Choose Theme:'),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                  widget.onThemeChange(value ? ThemeMode.dark : ThemeMode.light);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
