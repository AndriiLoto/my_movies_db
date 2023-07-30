import 'package:flutter/material.dart';
import 'package:my_movies_db/widgets/movieList/movie_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 1;
  void curretPage(int index) {
    if (currentPageIndex == index) {
      return;
    } else {
      setState(() {
        currentPageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Shows'),
        ],
        currentIndex: currentPageIndex,
        onTap: curretPage,
        enableFeedback: true,
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          Center(
            child: Text('News'),
          ),
          MovieList(),
          Center(
            child: Text('TV Shows'),
          ),
        ],
      ),
    );
  }
}
