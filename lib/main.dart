import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter NavigationRail Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _screen = [
    // Content for Home tab
    Container(
      color: Colors.yellow.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Home',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Feed tab
    Container(
      color: Colors.purple.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Feed',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Favorites tab
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Favorites',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Settings tab
    Container(
      color: Colors.pink.shade300,
      alignment: Alignment.center,
      child: const Text(
        'Settings',
        style: TextStyle(fontSize: 40),
      ),
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // desc : appBar
      appBar: AppBar(
        title: Text("Responsive site"),
        elevation: 0,
        backgroundColor: Colors.black,
      ),

      // desc : body
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              leading: Column(
                children: [
                  SizedBox(height: 8),
                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  )
                ],
              ),
              selectedIndex: _selectedIndex,
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: TextStyle(
                color: Colors.teal,
              ),
              unselectedLabelTextStyle: TextStyle(),
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: [
                NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(icon: Icon(Icons.feed), label: Text('Feed')),
                NavigationRailDestination(icon: Icon(Icons.favorite), label: Text('Favorites')),
                NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
              ],
            ),
          Expanded(child: _screen[_selectedIndex]),
        ],
      ),

      // desc : BottomNavigationBar
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.indigoAccent,
              unselectedItemColor: Colors.grey,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
              ],
            )
          : null,
    );
  }
}
