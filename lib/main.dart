import 'package:among_tinder/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: HomeScreen()));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> pageList = [];
  static const Color _tinderPink = Color.fromRGBO(254,60,114, 1);

  @override
  void initState() {
    pageList.add(SwipeScreen());
    pageList.add(FavoriteScreen());
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Among Tinder',
      color: _tinderPink,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Among Tinder",
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: _tinderPink,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: pageList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.whatshot),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
